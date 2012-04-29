class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "Get Started | Scratchboard"
  end
  
  def show
    @user = User.find(params[:id])
    @title = "Projects | Scratchboard"
    @projects = @user.projects
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
      flash[:"alert alert-success"] = "Success! Welcome to Scratchboard."
    else
      @title = "Get started | Scratchboard"
      render 'new'
    end
  end

end
