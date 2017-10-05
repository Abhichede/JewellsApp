json.extract! store_configuration, :id, :store_name, :store_desc, :email, :phone, :website, :address, :gstn, :created_at, :updated_at
json.url store_configuration_url(store_configuration, format: :json)
