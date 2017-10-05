JewellsApp.Views.StoreConfigurations ||= {}

class JewellsApp.Views.StoreConfigurations.StoreConfigurationView extends Backbone.View
  template: JST["backbone/templates/store_configurations/store_configuration"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    if confirm('Are you sure?')
      @model.destroy()
      this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
