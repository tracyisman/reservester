class StarsController < ApplicationController

    def create
        restaurant = Restaurant.find(params[:restaurant_id])
        if current_user
            restaurant.fans << current_user
        else
            restaurant.stars.create
        end
        render locals: {
            restaurant: restaurant
        }
    end

    def destroy
        restaurant = Restaurant.find(params[:restaurant_id])
        restaurant.fans.delete(current_user)
        render locals: {
            restaurant: restaurant
        }
    end

end
