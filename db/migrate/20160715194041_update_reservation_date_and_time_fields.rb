class UpdateReservationDateAndTimeFields < ActiveRecord::Migration
    def up
        remove_column :reservations, :date
        add_column :reservations, :reservation_date, :date
        add_column :reservations, :reservation_time, :time
    end

    def down
        add_column :reservations, :date, :date
        remove_column :reservations, :reservation_date
        remove_column :reservations, :reservation_time
    end
end
