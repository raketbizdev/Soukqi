class CreateCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :website
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
