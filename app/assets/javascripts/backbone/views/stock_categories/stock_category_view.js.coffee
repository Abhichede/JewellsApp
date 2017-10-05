JewellsApp.Views.StockCategories ||= {}

class JewellsApp.Views.StockCategories.StockCategoryView extends Backbone.View
  template: JST["backbone/templates/stock_categories/stock_category"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  initialize: () ->
    amount_spent = @model.get('amount_spent');
    @model.set('amount_spent', @model.numberInIndianCurrency(amount_spent))
    todays_rate = @model.get('todays_rate');
    @model.set('todays_rate', @model.numberInIndianCurrency(todays_rate))

  destroy: () ->
    if confirm('Are you sure?')
      @model.destroy()
      this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
