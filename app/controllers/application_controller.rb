class ApplicationController < ActionController::Base
    # Ensures the set_current_user method runs before each controller action
    before_action :set_current_user

    # Sets the Current.user object based on session data for logged-in users.
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    # Redirects to the sign-in path if a user is not logged in, 
    # requiring authentication for the requested action.
    def require_user_logged_in!
        redirect_to sign_in_path, aler: "You must be signed in to do that." if Current.user.nil?
    end
end
