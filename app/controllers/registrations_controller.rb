class RegistrationsController < ApplicationController
    def new_user
        @user = User.new
    end

    def create_user
        @user=User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created accout "
        else
            render :new_user
        end
    end

    def new_organizer
        @user = Organizer.new
    end

    def create_organizer
        render plain:"thanks"
    end
    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
    
end
