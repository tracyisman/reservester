class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :string
      t.string :owner_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
