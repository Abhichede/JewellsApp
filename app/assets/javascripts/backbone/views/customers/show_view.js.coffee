JewellsApp.Views.Customers ||= {}

class JewellsApp.Views.Customers.ShowView extends Backbone.View
  template: JST["backbone/templates/customers/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
