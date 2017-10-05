JewellsApp.Views.Customers ||= {}

class JewellsApp.Views.Customers.EditView extends Backbone.View
  template: JST["backbone/templates/customers/edit"]

  events:
    "submit #edit-customer": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (customer) =>
        @model = customer
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
