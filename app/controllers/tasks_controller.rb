class TasksController < ApplicationController
  def create
    @contact = Contact.find(params[:contact_id])
    @task = @contact.tasks.create(params[:task])
    redirect_to contact_path(@contact)
  end
  
  def edit
    #...
  end


  def destroy
    @contact = Contact.find(params[:contact_id])
    @task = @contact.tasks.find(params[:id])
    @task.destroy
    redirect_to contact_path(@contact)
  end
end

