class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :phone_number
      t.text :bio
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
