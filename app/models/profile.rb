class Profile < ApplicationRecord
  belongs_to :user
  has_many :resumes, dependent: :destroy
  has_one_attached :image_profile

  with_options on: :update do
    validates :first_name, :last_name, presence: true
  end

  def incomplete?
    first_name.blank? || last_name.blank?
  end
end
