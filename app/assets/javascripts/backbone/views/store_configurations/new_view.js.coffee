JewellsApp.Views.StoreConfigurations ||= {}

class JewellsApp.Views.StoreConfigurations.NewView extends Backbone.View
  template: JST["backbone/templates/store_configurations/new"]

  events:
    "submit #new-store_configuration": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (store_configuration) =>
        @model = store_configuration
        window.location.hash = "/#{@model.id}"

      error: (store_configuration, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
