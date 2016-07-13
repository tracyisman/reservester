class RestaurantsController < ApplicationController

    before_action :authenticate_owner!, except: [:show, :index]


    def new
        @restaurant = current_owner.restaurant.build
    end

    def create
        @restaurant = current_owner.restaurants.build(restaurant_params)

        if @restaurant.save
            redirect_to @restaurant
        else
            render 'new'
        end
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def index
        @restaurants = Restaurant.all
    end

    def edit
        @restaurant = current_owner.restaurants.find(params[:id])
    end

    def update
        @restaurant = current_owner.restaurants.find(params[:id])
        if @restaurant.update(restaurant_params)
            redirect_to @restaurant
        else
            render 'edit'
        end
    end

    def destroy
        @restaurant = current_owner.restaurants.find(params[:id])
        @restaurant.destroy
        redirect_to restaurants_path
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:owner_id, :name, :description, :address, :phone)
    end
end
