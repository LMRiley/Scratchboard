class UsersController < ApplicationController
before_filter :authenticate, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
    @title = "Get Started | Scratchboard"
  end
  
  def show
    @user = User.find(params[:id])
    @title = "Projects | Scratchboard"
    @projects = @user.projects
    if @user == current_user
      @user
    else
      redirect_to current_user
      flash[:"alert alert-danger"] = "Nice try, you do not have access to that user"
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit Profile | Scratchboard"
    if @user == current_user
      @user
    else
      redirect_to current_user 
      flash[:"alert alert-danger"] = "Nice try, you do not have access to that user"    
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
      flash[:"alert alert-success"] = "Welcome to Scratchboard!"
    else
      @title = "Get started | Scratchboard"
      render 'new'
    end
  end
  
end
