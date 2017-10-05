json.extract! customer, :id, :name, :address, :email, :contact, :total_amount, :paid_amount, :created_at, :updated_at
json.url customer_url(customer, format: :json)
