class MainController < ApplicationController
    def index
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        #flash.now[:notice] = "Logged successfully"
        #flash.now[:alert] = "Invalid credentials"
        end
    end
end