class CreateJobListings < ActiveRecord::Migration[7.2]
  def change
    create_table :job_listings do |t|
      t.string :title
      t.text :description
      t.string :location
      t.boolean :remote
      t.string :salary_range
      t.references :job_type, null: false, foreign_key: true
      t.boolean :visa_sponsorship
      t.boolean :relocation_assistance
      t.text :skills
      t.references :experience_level, null: false, foreign_key: true
      t.string :education_requirements
      t.text :job_benefits
      t.references :job_category, null: false, foreign_key: true
      t.string :job_status
      t.string :job_reference_id
      t.string :job_duration
      t.string :work_hours
      t.text :interview_process
      t.text :keywords
      t.text :remote_work_requirements
      t.string :job_function
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
