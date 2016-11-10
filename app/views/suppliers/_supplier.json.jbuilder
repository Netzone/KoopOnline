json.extract! supplier, :id, :name, :address, :email, :phone, :website, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)