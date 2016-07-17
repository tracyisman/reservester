class ReservationsController < ApplicationController

    def new
        @reservation = Reservation.new
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            redirect_to @reservation
        else
            render 'new'
        end
    end

    def show
        @reservation = Reservation.find(params[:id])
        @restaurant = Restaurant.find(@reservation.restaurant_id)
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
            redirect_to @reservation
        else
            render 'edit'
        end
    end

    def destroy
        @reservation = Reservations.find(params[:id])
        @reservation.destroy
        redirect_to reservations_path
    end

    private

    def reservation_params
        params.require(:reservation).permit(:name, :restaurant_id, :reservation_date, :reservation_time, :phone, :email)
    end
end
