class MainController < ApplicationController
    def index
        flash.now[:notice] = "Logged successfully"
        flash.now[:alert] = "Invalid credentials"
    end
end