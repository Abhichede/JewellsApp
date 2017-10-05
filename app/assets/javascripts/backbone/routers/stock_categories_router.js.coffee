class JewellsApp.Routers.StockCategoriesRouter extends Backbone.Router
  initialize: (options) ->
    @stock_categories = new JewellsApp.Collections.StockCategoriesCollection()
    @stock_categories.reset options.stock_categories

  routes:
    "new"      : "newStockCategory"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newStockCategory: ->
    @view = new JewellsApp.Views.StockCategories.NewView(collection: @stock_categories)
    $("#stock_categories").html(@view.render().el)

  index: ->
    @view = new JewellsApp.Views.StockCategories.IndexView(collection: @stock_categories)
    $("#stock_categories").html(@view.render().el)

  show: (id) ->
    stock_category = @stock_categories.get(id)

    @view = new JewellsApp.Views.StockCategories.ShowView(model: stock_category)
    $("#stock_categories").html(@view.render().el)

  edit: (id) ->
    stock_category = @stock_categories.get(id)

    @view = new JewellsApp.Views.StockCategories.EditView(model: stock_category)
    $("#stock_categories").html(@view.render().el)
