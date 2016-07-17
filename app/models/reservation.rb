class Reservation < ActiveRecord::Base
    validates :name, presence: true
    validates :reservation_time, presence: true
    validates :reservation_date, presence: true
    validates :email, presence: true
    belongs_to :restaurant
end
