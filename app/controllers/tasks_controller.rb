class TasksController < ApplicationController

  def index
    @contacts = current_user.contacts.all
  end

  def create
    @contact = current_user.contacts.find(params[:contact_id])
    @task = @contact.tasks.create(params[:task])
    redirect_to contact_path(@contact)
  end
  
  def edit
    #...
  end


  def destroy
    @contact = current_user.contacts.find(params[:contact_id])
    @task = @contact.tasks.find(params[:id])
    @task.destroy
    redirect_to contact_path(@contact)
  end
end

