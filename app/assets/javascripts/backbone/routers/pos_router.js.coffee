class JewellsApp.Routers.PosRouter extends Backbone.Router
  initialize: (options) ->
    @items = new JewellsApp.Collections.StocksCollection()
    @items.reset options.items

    @categories = options.categories
    @customers = options.customers

  routes:
    "index": "index"
    ".*" : "index"
  
  index: ->
    @view = new JewellsApp.Views.Pos.IndexView(collection: @items, categories: @categories, customers: @customers)
    $("#pos").html(@view.render().el)

