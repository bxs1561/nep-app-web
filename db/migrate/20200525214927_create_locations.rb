class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :url
      t.string :category
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
