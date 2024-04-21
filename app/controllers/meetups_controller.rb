class MeetupsController < ApplicationController

    # Fetches meetups relevant to the current user based on their role:
    # * Organizer: Meetups they have organized.
    # * Participant: Meetups they have registered for.
    def my_meetups
        if Current.user&.role == "organizer"
          @meetups = fetch_organized_meetups
        elsif Current.user&.role == "participant"
          @meetups = fetch_registered_meetups
        end
    end
      
      private
      
       # Fetches meetups where the current user is the organizer.
      def fetch_organized_meetups
        Meetup.where(organizer_id: Current.user.id)
      end
      
      # Fetches meetups the current user has registered for.
      def fetch_registered_meetups
        Current.user.meetup_registrations.includes(:meetup).map(&:meetup) 
      end
end