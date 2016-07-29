module Admin
    class ApplicationController < Administrate::ApplicationController
        before_filter :authenticate_owner

        def authenticate_owner
            current_user.owner?
        end

    end
end
