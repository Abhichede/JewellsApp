JewellsApp.Views.Customers ||= {}

class JewellsApp.Views.Customers.IndexView extends Backbone.View
  template: JST["backbone/templates/customers/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (customer) =>
    view = new JewellsApp.Views.Customers.CustomerView({model : customer})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(customers: @collection.toJSON() ))
    @addAll()

    return this
