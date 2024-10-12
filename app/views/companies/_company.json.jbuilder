json.extract! company, :id, :name, :description, :address, :city, :state, :zip, :country, :phone, :website, :user_id, :created_at, :updated_at
json.url company_url(company, format: :json)
