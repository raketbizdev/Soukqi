class JobType < ApplicationRecord
  has_many :job_listings, dependent: :destroy
end
