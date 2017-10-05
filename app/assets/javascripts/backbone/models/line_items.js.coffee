class JewellsApp.Models.LineItems extends Backbone.Model
  paramRoot: 'line_item'

  defaults:
    order_id: null
    category_id: null
    weight: null
    rate: null
    subtotal: null
    tax_rate: '0'
    total_tax: '0'
    total_amount: null
    deleting_status: false

class JewellsApp.Collections.LineItemsCollection extends Backbone.Collection
  model: JewellsApp.Models.LineItems
  url: '/line_items'
