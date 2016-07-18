class RestaurantMailer < ApplicationMailer
    default from: "tracyisman@gmail.com"

    def reservation_created(user)
        @user = user
        mail(to: 'tracyisman@gmail.com', subject: 'Reservation Created')
    end
end
