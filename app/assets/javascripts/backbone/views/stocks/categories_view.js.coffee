JewellsApp.Views.Stocks ||= {}

class JewellsApp.Views.Stocks.CategoriesView extends Backbone.View
  template: JST["backbone/templates/stocks/categories"]

  tagName: 'option'

  #value: @model.get('id')


  render: ->
    @$el.html(@template(@model.toJSON() )).attr('value', @model.get('id'))

    return this
