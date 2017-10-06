JewellsApp.Views.LineItems ||= {}

class JewellsApp.Views.LineItems.AddItem extends Marionette.View
  template: JST["backbone/templates/pos/add_item"]

  events: {
    'click a[data-action="add_item"]':'add_item'
  }

  initialize: (options) ->
    @line_item_collection = options.line_item_collection
    @pos_totals_region = options.totalsRegion

    @line_items_region = options.line_items_region
    @is_exists_flag = 0
    @existed_model = null

  addAll: () =>
    @collection.each(@addOne)

  addOne: (category) =>
    view = new JewellsApp.Views.Stocks.CategoriesView({model : category})
    @$("select#category").append(view.render().el)

  add_item: () ->
    cat_model = @collection.get(Number(@$('select#category').val()))

    weight = Number(@$('#weight').val())
    rate = Number(cat_model.get('todays_rate'))
    subtotal = weight * rate
    tax_rate = Number(@$('select#gst_rate').val())
    total_tax = (subtotal * tax_rate / 100)

    @line_item_collection.each(@is_exist)

    if(@is_exists_flag == 1)
      console.log(@existed_model)
      @existed_model.set({
        'weight': (@existed_model.get('weight')) + weight,
        'subtotal': (@existed_model.get('subtotal') + subtotal),
        'total_tax': ((@existed_model.get('subtotal') + subtotal) * tax_rate / 100),
        'total_amount': (@existed_model.get('subtotal') + subtotal) + ((@existed_model.get('subtotal') + subtotal) * tax_rate / 100)
      })
    else
      data = [{
        category_id: @$('select#category').val(),
        weight: weight,
        rate: rate,
        subtotal: subtotal,
        tax_rate: tax_rate,
        total_tax: total_tax,
        total_amount: (subtotal + total_tax),
        particular: @collection.get(Number(@$('select#category').val())).get('category_name')
      }]
      @line_item_collection.add(data)
      @line_items_view = new JewellsApp.Views.Pos.ItemView({model: @line_item_collection.at(@line_item_collection.length - 1), collection: @line_item_collection})
      $('.item_list').append(@line_items_view.render().el)

    @view = new JewellsApp.Views.Pos.ShowPosTotals({collection: @line_item_collection})
    @pos_totals_region.show(@view)

  is_exist: (model) =>
    if(model.get('category_id') == @$('select#category').val())
      @existed_model = model
      @is_exists_flag = 1
    else
      @is_exists_flag = 0

  render: ->
    @$el.html(@template())
    @addAll()
    return this
