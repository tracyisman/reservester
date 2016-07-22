class Restaurant < ActiveRecord::Base
    validates :name, presence: true
    validates :user, presence: true

    belongs_to :user, foreign_key: :owner_id

    has_many :reservations
    has_many :stars

    def owner?(possible_owner)
      possible_owner.owner? && possible_owner == user
    end
end
