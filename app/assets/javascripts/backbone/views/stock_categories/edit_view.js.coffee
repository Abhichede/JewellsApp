JewellsApp.Views.StockCategories ||= {}

class JewellsApp.Views.StockCategories.EditView extends Backbone.View
  template: JST["backbone/templates/stock_categories/edit"]

  events:
    "submit #edit-stock_category": "update"
    'blur #weight_in_stock': 'updateAmount'
    'blur #todays_rate': 'updateAmount'

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (stock_category) =>
        @model = stock_category
        window.location.hash = "/#{@model.id}"
    )

  updateAmount: () ->
    weight = Number(@$('#weight_in_stock').val())
    rate = Number(@$('#todays_rate').val())

    amount = rate * weight

    @model.set('amount_spent', amount)

    console.log(@model.get('amount_spent'))

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
