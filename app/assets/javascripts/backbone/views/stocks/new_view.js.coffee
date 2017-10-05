JewellsApp.Views.Stocks ||= {}

class JewellsApp.Views.Stocks.NewView extends Backbone.View
  template: JST["backbone/templates/stocks/new"]

  events:
    "submit #new-stock": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @CategoriesCollection = new JewellsApp.Collections.StockCategoriesCollection()
    @CategoriesCollection.reset options.categories

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (stock) =>
        @model = stock
        window.location.hash = "/#{@model.id}"

      error: (stock, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
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

    return this
