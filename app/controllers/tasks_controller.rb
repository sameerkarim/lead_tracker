class TasksController < ApplicationController
  def create
    @contact = Contact.find(params[:contact_id])
    @task = @contact.tasks.create(params[:task])
    redirect_to contact_path(@contact)
  end
end
