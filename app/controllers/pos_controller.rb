class PosController < ApplicationController
  def index
    @items = Stock.all
    @categories = StockCategory.all
    @customers = Customer.all
  end
end
