class MainController < ApplicationController
    # Handles requests to the main index of the application
    def index
        @meetups = Meetup.all
    end
end