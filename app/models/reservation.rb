class Reservation < ActiveRecord::Base
    validates :name, presence: true
    validates :reservation_time, presence: true
    validates :reservation_date, presence: true
    validates :email, presence: true

    belongs_to :restaurant

    private

    def reservation_time_must_be_in_the_future
        if reservation_at.present? && reservation_at < Time.now
            errors.add(:reservation_at, "can't be in the past")
        end
    end
end
