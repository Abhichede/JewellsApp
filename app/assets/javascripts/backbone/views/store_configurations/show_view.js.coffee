JewellsApp.Views.StoreConfigurations ||= {}

class JewellsApp.Views.StoreConfigurations.ShowView extends Backbone.View
  template: JST["backbone/templates/store_configurations/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
