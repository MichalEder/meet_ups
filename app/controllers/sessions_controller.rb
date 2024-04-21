class SessionsController < ApplicationController
    
    # Renders the login form
    def new
    end

    # Handles login attempts
    def create
        user = User.find_by(email: params[:email])
    

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in succesfully."
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
        
        
    end

    # Handles logging out a user
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end
end