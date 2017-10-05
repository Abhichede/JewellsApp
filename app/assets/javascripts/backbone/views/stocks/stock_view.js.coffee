JewellsApp.Views.Stocks ||= {}

class JewellsApp.Views.Stocks.StockView extends Backbone.View
  template: JST["backbone/templates/stocks/stock"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    if confirm('Are you sure?')
      @model.destroy()
      this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
