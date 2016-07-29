class Categories < ActiveRecord::Migration
  def change
      create_table :categories do |t|
          t.string :name
      end

      create_table :categories_restaurants do |t|
          t.integer :category_id
          t.integer :restaurant_id
      end
  end
end
