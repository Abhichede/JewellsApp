JewellsApp.Views.Stocks ||= {}

class JewellsApp.Views.Stocks.EditView extends Backbone.View
  template: JST["backbone/templates/stocks/edit"]

  events:
    "submit #edit-stock": "update"

  initialize: (options) ->
    @CategoriesCollection = new JewellsApp.Collections.StockCategoriesCollection()
    @CategoriesCollection.reset options.categories


  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (stock) =>
        @model = stock
        window.location.hash = "/#{@model.id}"
    )

  addAll: () =>
    @CategoriesCollection.each(@addOne)

  addOne: (category) =>
    view = new JewellsApp.Views.Stocks.CategoriesView({model : category})
    @$("div.category_ids > div >select").append(view.render().el)

  render: ->
    @$el.html(@template(@model.toJSON() ))

    @addAll()
    this.$("form").backboneLink(@model)
    @$("div.category_ids > div >select > option[value='"+@model.get('category_id')+"']").attr('selected', true)
    @$('select#gst_rate>option[value="'+@model.get("gst_rate")+'"]').attr('selected', true)
    return this
