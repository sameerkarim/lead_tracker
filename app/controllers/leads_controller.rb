class LeadsController < ApplicationController
  before_filter :signed_in_user
  
  def index
    @contacts = current_user.contacts.all
  end

  def new
    @contact = current_user.contacts.find(params[:contact_id])
    @lead = @contact.leads.create(params[:id])
    
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @contact }
    # end
    
  end

  def create
    @contact = current_user.contacts.find(params[:contact_id])
    @lead = @contact.leads.build(params[:lead]) #chagned to :id from :task
    
    if @lead.save
      flash[:success] = "Lead saved!"
        redirect_to contact_path(@contact) #contact_path(@contact)
    else
      flash[:error] = "Lead not saved!"  
        redirect_to contact_path(@contact)
    end
  end

  def edit
    @contact = current_user.contacts.find(params[:contact_id])
    @lead = @contact.leads.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json
    end   
  end

  def show
    @contact = current_user.contacts.find(params[:contact_id])
    @lead = @contact.leads.find(params[:id])
    #@task = @contact.tasks.find(params[:id])
    
     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @contact }
     end
  end

  def update
    @contact = current_user.contacts.find(params[:contact_id])
    @lead = @contact.leads.find(params[:id])

    respond_to do |format|
      if @lead.update_attributes(params[:lead])
        format.html { redirect_to @contact, notice: 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'There was an error!' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = current_user.contacts.find(params[:contact_id])
    @lead = @contact.leads.find(params[:id])
    @lead.destroy
    redirect_to contact_path(@contact)
  end

end
