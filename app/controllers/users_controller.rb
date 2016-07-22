class UsersController < ApplicationController
    before_filter :authenticate_user!

    def dashboard
        @user = current_user
        @restaurants = current_user.restaurants.all

        respond_to do |s|
            s.html
        end

    end
end
