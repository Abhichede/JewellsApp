JewellsApp.Views.Stocks ||= {}

class JewellsApp.Views.Stocks.ShowView extends Backbone.View
  template: JST["backbone/templates/stocks/show"]

  initialize:(options) ->
    @CategoriesCollection = new JewellsApp.Collections.StockCategoriesCollection()
    @CategoriesCollection.reset options.categories

    @model.set('category_name': @getCategoryName(@model))

  getCategoryName: (model) ->
    for category in @CategoriesCollection.models
      if category.get('id') == model.get('category_id')
        return category.get('category_name')

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
