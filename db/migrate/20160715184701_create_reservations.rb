class CreateReservations < ActiveRecord::Migration
    def change
        create_table :reservations do |t|
            t.string :name
            t.string :email
            t.string :phone
            t.time :reservation_time
            t.date :reservation_date
            t.string :restaurant
        end
    end
end
