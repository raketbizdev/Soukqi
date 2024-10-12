class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :companies, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  after_create :create_profile

  private

  def create_profile
    Profile.create(user: self)
  end
end
