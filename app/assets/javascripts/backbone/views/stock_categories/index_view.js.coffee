JewellsApp.Views.StockCategories ||= {}

class JewellsApp.Views.StockCategories.IndexView extends Backbone.View
  template: JST["backbone/templates/stock_categories/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (stockCategory) =>
    view = new JewellsApp.Views.StockCategories.StockCategoryView({model : stockCategory})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(stockCategories: @collection.toJSON() ))
    @addAll()

    return this
