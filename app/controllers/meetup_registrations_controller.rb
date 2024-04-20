class MeetupRegistrationsController < ApplicationController
    
    def create
        @meetup = Meetup.find(params[:meetup_id])
        @meetup_registration = MeetupRegistration.new(meetup_registration_params)
        
      
        if @meetup_registration.save
          redirect_to view_meetup_path(@meetup), notice: "Successfully registered for the meetup!"
        else
          redirect_to view_meetup_path(@meetup), notice: "Registration failed."
        end
    end

    def destroy
      @meetup = Meetup.find(params[:meetup_id])
      @registration = MeetupRegistration.find_by(meetup_deregistration_params) 
  
      if @registration.destroy
        redirect_to view_meetup_path(@meetup), notice: "Successfully deregistered from the meetup."
      else
        redirect_to view_meetup_path(@meetup), notice: "Deregistration failed."
      end
    end

  private

  def meetup_registration_params
    { user_id: Current.user.id, meetup_id: params[:meetup_id] }
  end

  def meetup_deregistration_params
    { user_id: Current.user.id, meetup_id: params[:meetup_id] }
  end

end
    