class MeetupsController < ApplicationController
    def my_meetups
        if Current.user&.role == "organizer"
          @meetups = fetch_organized_meetups
        elsif Current.user&.role == "participant"
          @meetups = fetch_registered_meetups
        end
    end
      
      private
      
      def fetch_organized_meetups
        Meetup.where(organizer_id: Current.user.id)
      end
      
      def fetch_registered_meetups
        Current.user.meetup_registrations.includes(:meetup).map(&:meetup) 
      end
end