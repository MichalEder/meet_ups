class MainController < ApplicationController
    def index
        @meetups = Meetup.all
    end
end