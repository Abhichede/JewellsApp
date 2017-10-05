JewellsApp.Views.StockCategories ||= {}

class JewellsApp.Views.StockCategories.NewView extends Backbone.View
  template: JST["backbone/templates/stock_categories/new"]

  events:
    "submit #new-stock_category": "save"
    'blur #weight_in_stock': 'updateAmount'
    'blur #todays_rate': 'updateAmount'

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (stock_category) =>
        @model = stock_category
        window.location.hash = "/#{@model.id}"

      error: (stock_category, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
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
