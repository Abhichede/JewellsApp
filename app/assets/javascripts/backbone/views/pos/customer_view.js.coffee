JewellsApp.Views.Pos ||= {}

class JewellsApp.Views.Pos.CustomerListView extends Marionette.View
  template: JST["backbone/templates/pos/customer_list"]

  tagName: 'option'

  render: ->
    @$el.html(@template(@model.toJSON() )).attr('value', @model.get('id'))
    return this
