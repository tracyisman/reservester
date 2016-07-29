module Admin
    class StarsController < Admin::ApplicationController

        def index
            super
            @resources = current_user.restaurants.includes(:stars).flat_map(&:stars)
        end

    end
end
