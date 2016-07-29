class AddForeignKeysToStarTable < ActiveRecord::Migration
  def change
      add_reference :stars, :restaurant, index: true, foreign_key: true
      add_reference :stars, :user, index: true, foreign_key: true
  end

end
