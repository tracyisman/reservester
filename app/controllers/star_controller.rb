class StarController < ApplicationController

    def create
        # make it a star
        @star = Star.new
    end

    def destroy
        # unmake it a star
        @star.destroy
    end


end
