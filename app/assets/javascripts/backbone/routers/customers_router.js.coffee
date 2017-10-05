class JewellsApp.Routers.CustomersRouter extends Backbone.Router
  initialize: (options) ->
    @customers = new JewellsApp.Collections.CustomersCollection()
    @customers.reset options.customers

  routes:
    "new"      : "newCustomer"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newCustomer: ->
    @view = new JewellsApp.Views.Customers.NewView(collection: @customers)
    $("#customers").html(@view.render().el)

  index: ->
    @view = new JewellsApp.Views.Customers.IndexView(collection: @customers)
    $("#customers").html(@view.render().el)

  show: (id) ->
    customer = @customers.get(id)

    @view = new JewellsApp.Views.Customers.ShowView(model: customer)
    $("#customers").html(@view.render().el)

  edit: (id) ->
    customer = @customers.get(id)

    @view = new JewellsApp.Views.Customers.EditView(model: customer)
    $("#customers").html(@view.render().el)
