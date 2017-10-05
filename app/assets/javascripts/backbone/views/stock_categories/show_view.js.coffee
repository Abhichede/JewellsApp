JewellsApp.Views.StockCategories ||= {}

class JewellsApp.Views.StockCategories.ShowView extends Backbone.View
  template: JST["backbone/templates/stock_categories/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
