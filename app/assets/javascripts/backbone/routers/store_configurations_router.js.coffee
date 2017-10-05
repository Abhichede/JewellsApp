class JewellsApp.Routers.StoreConfigurationsRouter extends Backbone.Router
  initialize: (options) ->
    @storeConfigurations = new JewellsApp.Collections.StoreConfigurationsCollection()
    @storeConfigurations.reset options.storeConfigurations

  routes:
    "new"      : "newStoreConfiguration"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newStoreConfiguration: ->
    @view = new JewellsApp.Views.StoreConfigurations.NewView(collection: @storeConfigurations)
    $("#store_configurations").html(@view.render().el)

  index: ->
    @view = new JewellsApp.Views.StoreConfigurations.IndexView(collection: @storeConfigurations)
    $("#store_configurations").html(@view.render().el)

  show: (id) ->
    store_configuration = @storeConfigurations.get(id)

    @view = new JewellsApp.Views.StoreConfigurations.ShowView(model: store_configuration)
    $("#store_configurations").html(@view.render().el)

  edit: (id) ->
    store_configuration = @storeConfigurations.get(id)

    @view = new JewellsApp.Views.StoreConfigurations.EditView(model: store_configuration)
    $("#store_configurations").html(@view.render().el)
