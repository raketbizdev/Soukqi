class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image_profile

  with_options on: :update do
    validates :first_name, :last_name, :date_of_birth, :address, :city, :state, :country, :postal_code, :phone_number, presence: true
    validates :phone_number, format: { with: /\A\+?[0-9]{10,15}\z/, message: "must be a valid phone number" }
    validates :postal_code, format: { with: /\A[0-9]{5}(-[0-9]{4})?\z/, message: "must be a valid postal code" }
  end
end
