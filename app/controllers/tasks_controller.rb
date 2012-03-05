class TasksController < ApplicationController
  before_filter :signed_in_user
  
  def index
    @contacts = current_user.contacts.all
  end

  def create
    @contact = current_user.contacts.find(params[:contact_id])
    @task = @contact.tasks.build(params[:task]) #chagned to :id from :task
    
    if @task.save
      flash[:success] = "Task saved!"
        redirect_to contact_path(@contact) #contact_path(@contact)
    else
      flash[:error] = "Task not saved!"  
        redirect_to contact_path(@contact)
    end
  end
  
  def edit
    @contact = current_user.contacts.find(params[:contact_id])
    @task = @contact.tasks.find(params[:id])
  end

  def show
    @contact = current_user.contacts.find(params[:contact_id])
    @task = @contact.tasks.find(params[:id])
    #@task = @contact.tasks.find(params[:id])
    
     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @contact }
     end
  end

  def update
    @contact = current_user.contacts.find(params[:contact_id])
    @task = @contact.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @contact, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'There was an error!' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def new
    @contact = current_user.contacts.find(params[:contact_id])
    @task = @contact.tasks.create(params[:id])
    
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @contact }
    # end
    
  end


  def destroy
    @contact = current_user.contacts.find(params[:contact_id])
    @task = @contact.tasks.find(params[:id])
    @task.destroy
    redirect_to contact_path(@contact)
  end
end

