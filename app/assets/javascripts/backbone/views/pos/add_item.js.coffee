JewellsApp.Views.Pos ||= {}

class JewellsApp.Views.Pos.AddItem extends Marionette.View
  template: JST["backbone/templates/pos/add_item"]

  events: {
    'click a[data-action="add_item"]':'add_item'
    'click a[data-action="remove_item"]':'remove_item'
  }


  addAll: () =>
    @collection.each(@addOne)

  addOne: (category) =>
    view = new JewellsApp.Views.Stocks.CategoriesView({model : category})
    @$("select#category").append(view.render().el)

  add_item: () ->
    @$("select#category").attr('disabled',  true)
    @$("input#weight").attr('disabled',  true)
    @$("select#gst_rate").attr('disabled',  true)

    @$("div#add_btn").attr('class', 'form-group pull-right hidden')
    @$("div#remove_btn").attr('class', 'form-group pull-right')

    @view = new JewellsApp.Views.Pos.ItemView({parentEl: @parentEl, collection: @collection})
    @$el.parent().append(@view.render().el)

  remove_item: () ->
    @$el.remove()

  render: ->
    @$el.html(@template())
    @addAll()
    return this
