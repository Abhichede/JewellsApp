class JewellsApp.Models.StoreConfiguration extends Backbone.Model
  paramRoot: 'store_configuration'

  defaults:
    store_name: null
    store_desc: null
    email: null
    phone: null
    website: null
    address: null
    gstn: null

class JewellsApp.Collections.StoreConfigurationsCollection extends Backbone.Collection
  model: JewellsApp.Models.StoreConfiguration
  url: '/store_configurations'
