class MeetupController < ApplicationController
    before_action :require_user_logged_in!
    before_action :require_organizer_role, only: [:create, :destroy]

    def new
        @meetup = Meetup.new
        @meetup.organizer_id = Current.user.id
    end
    
    def show
        @meetup = Meetup.find(params[:id])
    end

    def edit
        @meetup = Meetup.find(params[:id])
    end

    def update
        @meetup = Meetup.find(params[:id])
      
        if @meetup.update(meetup_params)
          redirect_to meetups_path, notice: "Meetup edited successfully"  
        else
          render :edit 
        end
    end

    def destroy
        @meetup = Meetup.find(params[:id])

        if @meetup.destroy
            redirect_to meetups_path, notice: "Meetup deleted successfully."
        else
            redirect_to meetups_path, alert: "Could not delete meetup. Please try again."       
        end
    end
  
    def create
      @meetup = Meetup.new(meetup_params)  
  
      if @meetup.save
        redirect_to meetups_path, notice: "Meetup created successfully" 
      else
        render :new 
    end
    
    
end
  
    private
  
    def require_organizer_role
      redirect_to root_path, alert: "You must be an organizer to create/delete meetups" unless Current.user&.role == "organizer"
    end
  
    def meetup_params
      params.require(:meetup).permit(:title, :description, :location, :datetime, :organizer_id) 
    end
  end
