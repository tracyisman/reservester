class RestaurantsController < ApplicationController

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(params[:restaurant])

        @restaurant.save
        redirect_to @restaurant
    end

end
