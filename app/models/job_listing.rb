class JobListing < ApplicationRecord
  belongs_to :job_type
  belongs_to :experience_level
  belongs_to :job_category
  belongs_to :company

  validates :title, :description, :location, :job_type, :job_status, :experience_level, :education_requirements, presence: true
end
