module Admin
    class RestaurantsController < Admin::ApplicationController
        def index
            super
            @resources = current_user.restaurants
        end

        def resource_params
            super.merge(owner_id: current_user.id)
        end
    end
end
