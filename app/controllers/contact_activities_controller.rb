class ContactActivitiesController < ApplicationController
  before_filter :signed_in_user
  
  # def index
  #    @contacts = current_user.contacts.all
  # end
  # 
   def create
      @contact = current_user.contacts.find(params[:contact_id])
      @contact_activity = @contact.contact_activities.build(params[:contact_activity]) #chagned to :id from :task
   
      if @contact_activity.save
        flash[:success] = "Activity saved!"
          redirect_to contact_path(@contact) #contact_path(@contact)
      else
        flash[:error] = "Activity not saved!"  
          redirect_to contact_path(@contact)
      end
    end
   
   def edit
     @contact = current_user.contacts.find(params[:contact_id])
     @contact_activity = @contact.contact_activities.find(params[:id])
  
     respond_to do |format|
       format.html
       format.json
     end   
   end
  
    def show
      @contact = current_user.contacts.find(params[:contact_id])
      @contact_activity = @contact.contact_activities.find(params[:id])
      #@task = @contact.tasks.find(params[:id])
   
       respond_to do |format|
         format.html # show.html.erb
         format.json { render json: @contact }
       end
    end
   
   def update
     @contact = current_user.contacts.find(params[:contact_id])
     @contact_activity = @contact.contact_activities.find(params[:id])
  
     respond_to do |format|
       if @contact_activity.update_attributes(params[:contact_activity])
         format.html { redirect_to @contact, notice: 'Activity was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit", notice: 'There was an error!' }
         format.json { render json: @contact.errors, status: :unprocessable_entity }
       end
     end
   end
  
   def new
     @contact = current_user.contacts.find(params[:contact_id])
     @contact_activity = @contact.contact_activities.create(params[:id]) #3/8/2012 note: I'm pretty sure this should be :task, not :id!
 
     # respond_to do |format|
     #    format.html # new.html.erb
     #    format.json { render json: @contact }
     #  end
  
   end
  
  
   def destroy
     @contact = current_user.contacts.find(params[:contact_id])
     @contact_activity = @contact.contact_activities.find(params[:id])
     @contact_activity.destroy
     redirect_to contact_path(@contact)
   end
  
end
