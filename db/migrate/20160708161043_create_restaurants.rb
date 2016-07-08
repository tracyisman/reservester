class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :owner_id
      t.string :name
      t.text :description
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
