class DeleteOwnerIdFromRestaurant < ActiveRecord::Migration
  def change
      remove_column :restaurants, :owner_id
  end
end
