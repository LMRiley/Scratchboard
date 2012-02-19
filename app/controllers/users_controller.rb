class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "Get started with Scratchboard"
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
      flash[:success] = "Success! Welcome to Scratchboard"
    else
      @title = "Get started"
      render 'new'
    end
  end

end
