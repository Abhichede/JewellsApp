JewellsApp.Views.Pos ||= {}

class JewellsApp.Views.Pos.ItemListView extends Marionette.View

  tagName: 'ul'

  className: 'list-group'

  initialize: (options) ->
    @categories = new JewellsApp.Collections.StockCategoriesCollection()
    @categories.reset options.categories
    @parentEl = options.parentEl

  getCategoryName: (model) ->
    for category in @categories.models
      if category.get('id') == model.get('category_id')
        return category.get('category_name')

  getTodaysRate: (model) ->
    for category in @categories.models
      if category.get('id') == model.get('category_id')
        return category.get('todays_rate')

  render: ->
    @view = new JewellsApp.Views.Pos.ItemView({parentEl: @parentEl, collection: @categories})
    @$el.append(@view.render().el)
    return this
