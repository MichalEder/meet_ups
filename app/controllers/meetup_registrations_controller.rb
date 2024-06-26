class MeetupRegistrationsController < ApplicationController
    
    # Handles creation of new meetup registrations
    def create
        @meetup = Meetup.find(params[:meetup_id])

        # Create a new registration object, associating it with the current user
        @meetup_registration = MeetupRegistration.new(meetup_registration_params)
        
      
        if @meetup_registration.save
          redirect_to view_meetup_path(@meetup), notice: "Successfully registered for the meetup!"
        else
          redirect_to view_meetup_path(@meetup), notice: "Registration failed."
        end
    end

    # Handles the deletion of existing meetup registrations
    def destroy
      @meetup = Meetup.find(params[:meetup_id])

      # Find the registration that matches the current user and meetup
      @registration = MeetupRegistration.find_by(meetup_deregistration_params) 
  
      if @registration.destroy
        redirect_to view_meetup_path(@meetup), notice: "Successfully deregistered from the meetup."
      else
        redirect_to view_meetup_path(@meetup), notice: "Deregistration failed."
      end
    end

  private

  # Defines permitted parameters for creating a meetup registration.
  # Ensures user_id is taken from the current user for security
  def meetup_registration_params
    { user_id: Current.user.id, meetup_id: params[:meetup_id] }
  end

  # Defines permitted parameters for finding a registration to deregister.
  # Ensures user_id is taken from the current user for security.
  def meetup_deregistration_params
    { user_id: Current.user.id, meetup_id: params[:meetup_id] }
  end

end
    