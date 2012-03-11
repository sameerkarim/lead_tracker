class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :edit, :update]
  before_filter :correct_user,   only: [:show, :edit, :update]
  before_filter :admin_user,     only: [:index, :destroy]
  
  
  def index #need to make this visible to admins only later, based on index in rails tutorial
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @contacts = @user.contacts.all
    
    #return count of tasks by contact for the dashboard page
    @tasks_count = Hash.new(0)
    @contacts.each do |contact|
      @tasks_count[contact.name] += contact.tasks.count
    end
    
    #return count of leads by contact for the dashboard page
    @leads_count = Hash.new(0)
    @contacts.each do |contact|
      @leads_count[contact.name] += contact.leads.count
    end
  end
  
  def new
      @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Lead Tracker!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    #@user = User.find(params[:id]) #removed because this is now taken care of by correct_user
  end
  
  def update
    #@user = User.find(params[:id]) #removed because this is now taken care of by correct_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
end
