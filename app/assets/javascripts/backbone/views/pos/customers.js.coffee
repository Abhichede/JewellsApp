JewellsApp.Views.Pos ||= {}

class JewellsApp.Views.Pos.CustomersView extends Marionette.View
  template: JST["backbone/templates/pos/customers"]

  className: 'form-group'

  initialize: (options) ->
    @customersCollection = new JewellsApp.Collections.CustomersCollection()
    @customersCollection.reset options.customers

  addCustomers: () =>
    @customersCollection.each(@customer_item)

  customer_item: (customer) =>
    view = new JewellsApp.Views.Pos.CustomerListView({model : customer})
    @$("select#customers_list").append(view.render().el)


  render: ->
    @$el.html(@template())

    @addCustomers()
    return this
