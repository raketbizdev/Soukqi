class Resume < ApplicationRecord
  belongs_to :profile

  # Add a method to combine the first and last name from the profile
  def name
    "#{profile.first_name} #{profile.last_name}"
  end
end
