class Company < ApplicationRecord
  belongs_to :user
  has_many :job_listings, dependent: :destroy  # Add this line

  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 4 }
  validates :country, presence: true
  validates :phone, presence: true, format: { with: /\A\+?[\d\s\-]+\z/, message: "only allows valid phone numbers" }
  validates :website, format: { with: /\Ahttps?:\/\/[^\s]+\z/, message: "must be a valid URL" }, allow_blank: true
end
