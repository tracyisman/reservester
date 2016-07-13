class Restaurant < ActiveRecord::Base
    validates :name, presence: true
    validates :owner_id, presence: true
    belongs_to :owner
end
