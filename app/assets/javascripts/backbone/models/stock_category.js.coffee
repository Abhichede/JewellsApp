class JewellsApp.Models.StockCategory extends Backbone.Model
  paramRoot: 'stock_category'

  defaults:
    category_name: null
    quality: null
    todays_rate: '0'
    weight_in_stock: '0'
    amount_spent: '0'
    deleting_status: false

  numberInIndianCurrency: (input) ->
      if (! isNaN(input))
        #var output = Number(input).toLocaleString('en-IN');   <-- This method is not working fine in all browsers!
        result = input.toString().split('.')

        lastThree = result[0].substring(result[0].length - 3)
        otherNumbers = result[0].substring(0, result[0].length - 3)

        if (otherNumbers != '')
          lastThree = ',' + lastThree
        output = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree

        if (result.length > 1)
          output += "." + result[1]

        return  output

class JewellsApp.Collections.StockCategoriesCollection extends Backbone.Collection
  model: JewellsApp.Models.StockCategory
  url: '/stock_categories'
