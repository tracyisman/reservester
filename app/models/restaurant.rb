class Restaurant < ActiveRecord::Base
    validates :name, presence: true
    validates :owner_id, presence: true, length: {minimum: 3}
end
