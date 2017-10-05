JewellsApp.Views.Stocks ||= {}

class JewellsApp.Views.Stocks.IndexView extends Backbone.View
  template: JST["backbone/templates/stocks/index"]

  initialize: (options) ->
    @collection.bind('reset', @addAll)

    @CategoriesCollection = new JewellsApp.Collections.StockCategoriesCollection()
    @CategoriesCollection.reset options.categories

  addAll: () =>
    @collection.each(@addOne)

  addOne: (stock) =>
    stock.set('category_name': @getCategoryName(stock))
    view = new JewellsApp.Views.Stocks.StockView({model : stock})
    @$("tbody").append(view.render().el)

  getCategoryName: (model) ->
    for category in @CategoriesCollection.models
      if category.get('id') == model.get('category_id')
        return category.get('category_name')

  render: =>
    @$el.html(@template(stocks: @collection.toJSON() ))
    @addAll()

    return this
