json.extract! stock_category, :id, :category_name, :quality, :todays_rate, :weight_in_stock, :amount_spent, :created_at, :updated_at
json.url stock_category_url(stock_category, format: :json)
