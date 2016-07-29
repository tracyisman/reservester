class Restaurant < ActiveRecord::Base
    validates :name, presence: true
    validates :user, presence: true

    belongs_to :user, foreign_key: :owner_id

    has_many :reservations
    has_many :stars
    has_many :fans, through: :stars, source: :user
    has_and_belongs_to_many :categories
    belongs_to :owner, class_name: "User"

    def owner?(possible_owner)
      possible_owner.owner? && possible_owner == user
    end


end
