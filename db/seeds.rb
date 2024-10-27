# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seed data for Job Types
job_types = [
  { name: 'Full-time' },
  { name: 'Part-time' },
  { name: 'Contract' },
  { name: 'Freelance' },
  { name: 'Temporary' },
  { name: 'Internship' }
]

job_types.each do |job_type|
  JobType.find_or_create_by(name: job_type[:name])
end

# Seed data for Experience Levels
experience_levels = [
  { name: 'Entry Level' },
  { name: 'Mid Level' },
  { name: 'Senior Level' },
  { name: 'Manager' },
  { name: 'Director' },
  { name: 'Executive' }
]

experience_levels.each do |experience_level|
  ExperienceLevel.find_or_create_by(name: experience_level[:name])
end

# Seed data for Job Categories
job_categories = [
  { name: 'Software Engineering' },
  { name: 'Product Management' },
  { name: 'Data Science' },
  { name: 'Marketing' },
  { name: 'Sales' },
  { name: 'Customer Support' },
  { name: 'Human Resources' },
  { name: 'Finance' }
]

job_categories.each do |job_category|
  JobCategory.find_or_create_by(name: job_category[:name])
end
