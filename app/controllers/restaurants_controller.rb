class RestaurantsController < ApplicationController

    before_action :authenticate_user!, except: [:show, :index]

    def new
        @restaurant = current_user.restaurants.build
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)

        if @restaurant.save
            redirect_to @restaurant, notice: 'Restaurant was successfully created.'
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
        @restaurant = current_user.restaurants.find(params[:id])
    end

    def update
        @restaurant = current_user.restaurants.find(params[:id])
        if @restaurant.update(restaurant_params)
            redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
        else
            render 'edit'
        end
    end

    def destroy
        @restaurant = current_user.restaurants.find(params[:id])
        @restaurant.destroy
        redirect_to restaurants_path
    end

    def star
    end

    private

    def restaurant_params
        params.
          require(:restaurant).
          permit(:name, :description, :address, :phone, category_ids: []).
          merge(owner_id: current_user.id)
    end
end
