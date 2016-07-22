class ReservationsController < ApplicationController

    before_action :get_restaurant

    def new
        @reservation = Reservation.new
    end

    def create
        #@user = User.new(user_params)

        #respond_to do |f|
            @reservation = Reservation.new(reservation_params)
            if @reservation.save
                RestaurantMailer.reservation_created(@reservation).deliver
                redirect_to restaurant_reservation_path(restaurant_id: @restaurant.id, id: @reservation.id)

                #f.html { redirect_to @user, notice: 'User was successfully created.'}
                #f.json { render :show, status: :created, location: @user }
            else
                render 'new'
                #f.html { render :new }
                #f.json { render json: @user.errors, status: :unprocessable_entity }
            end
        #end
    end

    def show
        @reservation = Reservation.find(params[:id])
    end

    def index
        @reservation = Reservation.all
    end

    def edit
        @reservation = Reservation.find(params[:id])
    end

    def update
        @reservation = Reservation.find(params[:id])
        if @reservation.update(reservation_params)
            redirect_to [@restaurant, @reservation]
        else
            render 'edit'
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        redirect_to restaurants_path
    end

    private

    def reservation_params
        params.require(:reservation).permit(:name, :restaurant_id, :reservation_date, :reservation_time, :phone, :email)
    end

    def get_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
