class MainController < ApplicationController
    def index
        flash[:notice] = "Logged successfully"
        flash[:alert] = "Invalid credentials"
    end
end