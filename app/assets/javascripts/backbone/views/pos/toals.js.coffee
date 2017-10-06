JewellsApp.Views.Pos ||= {}

class JewellsApp.Views.Pos.PosTotals extends Marionette.LayoutView
  template: JST["backbone/templates/pos/pos_totals"]
  
  regions: {
    pos_item_select: 'div.item_selection',
    pos_totals: 'div.pos_totals'
  }
  
  initialize: (options) ->
    @categories = new JewellsApp.Collections.StockCategoriesCollection()
    @categories.reset options.categories
    
    
  addItem: () -> 
    @view = new JewellsApp.Views.Pos.AddItem({collection: @categories})
    @getRegion('pos_item_select').show(@view)
  

  render: ->
    @$el.html(@template())
    @addItem()
    return this
