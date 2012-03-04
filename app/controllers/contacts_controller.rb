class ContactsController < ApplicationController
    before_filter :signed_in_user # , only: [:index, :show, :edit, :update]
    #Will need to uncomment the line below and the block below the private below when I get the user relationship worked out
    #before_filter :correct_user#  ,   only: [:index, :show, :edit, :update]
  
  # GET /contacts
  # GET /contacts.json
  def index
    #@contacts = Contact.all
    @contacts = Contact.order(:name)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_url }
        #format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end
  
  
private
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
  end

#Will need to uncomment the below code when I get the user>contacts relationship worked out  
#  def correct_user
#    @user = User.find(params[:id])
#    redirect_to(root_path) unless current_user?(@user)
#  end
end
