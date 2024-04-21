class MeetupController < ApplicationController
    # Ensures a user is logged in before accessing any meetup actions
    before_action :require_user_logged_in!
    # Restricts create and destroy actions to users with the "organizer" role
    before_action :require_organizer_role, only: [:create, :destroy]

    # Displays a form to create a new meetup
    def new
        @meetup = Meetup.new
        # Assigns the current user as the organizer of the new meetup
        @meetup.organizer_id = Current.user.id
    end
    
    # Displays the details of a specific meetup 
    def show
        @meetup = Meetup.find(params[:id])
    end

    # Displays a form to edit an existing meetup
    def edit
        @meetup = Meetup.find(params[:id])
    end

    # Updates an existing meetup
    def update
        @meetup = Meetup.find(params[:id])
      
        if @meetup.update(meetup_params)
          redirect_to meetups_path, notice: "Meetup edited successfully"  
        else
          render :edit 
        end
    end

    # Deletes a meetup
    def destroy
        @meetup = Meetup.find(params[:id])

        if @meetup.destroy
            redirect_to meetups_path, notice: "Meetup deleted successfully."
        else
            redirect_to meetups_path, alert: "Could not delete meetup. Please try again."       
        end
    end
  
    # Creates a new meetup
    def create
      @meetup = Meetup.new(meetup_params)  
  
      if @meetup.save
        redirect_to meetups_path, notice: "Meetup created successfully" 
      else
        render :new 
    end
    
    
end
  
    private

    # Enforces authorization, requiring the "organizer" role to create or delete meetups
    def require_organizer_role
      redirect_to root_path, alert: "You must be an organizer to create/delete meetups" unless Current.user&.role == "organizer"
    end

    # Defines permitted parameters for creating/updating meetups (strong parameters)
    def meetup_params
      params.require(:meetup).permit(:title, :description, :location, :datetime, :organizer_id) 
    end
  end
