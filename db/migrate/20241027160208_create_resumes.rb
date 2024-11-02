class CreateResumes < ActiveRecord::Migration[7.2]
  def change
    create_table :resumes do |t|
      t.string :professional_title
      t.text :profile_summary
      t.string :location
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
