class JewellsApp.Models.Orders extends Backbone.Model
  paramRoot: 'order'

  defaults:
    customer_id: null
    subtotal: null
    tax_rate: '0'
    total_tax: '0'
    total_amount: null
    extra_fee: '0'
    date: null
    extra_notes: ''
    deleting_status: false

class JewellsApp.Collections.OrdersCollection extends Backbone.Collection
  model: JewellsApp.Models.Orders
  url: '/orders'
