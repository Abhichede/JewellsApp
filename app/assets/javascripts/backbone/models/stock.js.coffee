class JewellsApp.Models.Stock extends Backbone.Model
  paramRoot: 'stock'

  defaults:
    sku: null
    name: null
    category_id: null
    purchase_rate: null
    quantity: null
    weight: null
    gst_rate: null

class JewellsApp.Collections.StocksCollection extends Backbone.Collection
  model: JewellsApp.Models.Stock
  url: '/stocks'
