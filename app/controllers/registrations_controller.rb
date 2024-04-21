class RegistrationsController < ApplicationController

    # Renders a form to create a new user account (sign up)
    def new
        @user = User.new
    end

    # Handles the submission of the new user registration form
    def create
        @user=User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account. "
        else
            render :new
        end
    end
    
    private

    # Defines permitted parameters for user creation (strong parameters)
    def user_params
        params.require(:user).permit(:email, :name, :role, :password, :password_confirmation)
    end
    
end
