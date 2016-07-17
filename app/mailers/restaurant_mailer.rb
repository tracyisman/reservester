class RestaurantMailer < ApplicationMailer
    def reservation_created
        @cool = "cool variable"
        mail(to: 'tracyisman@gmail.com', subject: 'Reservation Created')
    end
end
