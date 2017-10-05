JewellsApp.Views.Pos ||= {}

class JewellsApp.Views.Pos.IndexView extends Marionette.LayoutView
  template: JST["backbone/templates/pos/index"]

  regions: {
    customers: '#customers',
    list: '#list',
    totals: '#totals'
  }

  initialize: (options) ->
    @categories =  options.categories
    @customers = options.customers


  renderList: () ->
    @view = new JewellsApp.Views.Pos.ItemListView({collection: @collection, categories: @categories, parentEl: @$('.orders-panel-body')})
    @getRegion('list').show(@view)

  customer_list: () ->
    @view = new JewellsApp.Views.Pos.CustomersView({customers: @customers})
    @getRegion('customers').show(@view)

  render: ->
    @$el.html(@template())
    @renderList()
    @customer_list()
    return this
