json.extract! profile, :id, :first_name, :last_name, :date_of_birth, :address, :city, :state, :country, :postal_code, :phone_number, :bio, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
