class FixRestaurantId < ActiveRecord::Migration
    def up
        remove_column :reservations, :restaurant
        add_column :reservations, :restaurant_id, :integer
    end

    def down
        add_column :reservations, :restaurant, :string
        remove_column :reservations, :restaurant_id
    end
end
