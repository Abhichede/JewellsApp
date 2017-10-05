class JewellsApp.Models.Customer extends Backbone.Model
  paramRoot: 'customer'

  defaults:
    name: null
    address: null
    email: null
    contact: null
    total_amount: 0
    paid_amount: 0

class JewellsApp.Collections.CustomersCollection extends Backbone.Collection
  model: JewellsApp.Models.Customer
  url: '/customers'
