JewellsApp.Views.StoreConfigurations ||= {}

class JewellsApp.Views.StoreConfigurations.IndexView extends Backbone.View
  template: JST["backbone/templates/store_configurations/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (storeConfiguration) =>
    view = new JewellsApp.Views.StoreConfigurations.StoreConfigurationView({model : storeConfiguration})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(storeConfigurations: @collection.toJSON() ))
    @addAll()

    return this
