class JewellsApp.Routers.StocksRouter extends Backbone.Router
  initialize: (options) ->
    @stocks = new JewellsApp.Collections.StocksCollection()
    @stocks.reset options.stocks

    @stcoks_categories = options.stock_categories


  routes:
    "new"      : "newStock"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newStock: ->
    @view = new JewellsApp.Views.Stocks.NewView(collection: @stocks, categories: @stcoks_categories)
    $("#stocks").html(@view.render().el)

  index: ->
    @view = new JewellsApp.Views.Stocks.IndexView(collection: @stocks, categories: @stcoks_categories)
    $("#stocks").html(@view.render().el)

  show: (id) ->
    stock = @stocks.get(id)

    @view = new JewellsApp.Views.Stocks.ShowView(model: stock, categories: @stcoks_categories)
    $("#stocks").html(@view.render().el)

  edit: (id) ->
    stock = @stocks.get(id)

    @view = new JewellsApp.Views.Stocks.EditView(model: stock, categories: @stcoks_categories)
    $("#stocks").html(@view.render().el)
