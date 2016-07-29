module Admin
    class UsersController < Admin::ApplicationController
        def index
            super
            @resources = current_user.restaurants.includes(:fans).flat_map(&:fans)
        end

    end
end
