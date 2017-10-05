JewellsApp.Views.StoreConfigurations ||= {}

class JewellsApp.Views.StoreConfigurations.EditView extends Backbone.View
  template: JST["backbone/templates/store_configurations/edit"]

  events:
    "submit #edit-store_configuration": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (store_configuration) =>
        @model = store_configuration
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
