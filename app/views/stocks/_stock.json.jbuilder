json.extract! stock, :id, :sku, :name, :category_id, :purchase_rate, :quantity, :weight, :gst_rate, :created_at, :updated_at
json.url stock_url(stock, format: :json)
