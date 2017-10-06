JewellsApp.Views.Pos ||= {}

class JewellsApp.Views.Pos.ItemView extends Marionette.View
  template: JST["backbone/templates/pos/item_list_view"]

  tagName: 'li'

  className: 'list-group-item'

  render: ->
    @$el.html(@template())
    return this
