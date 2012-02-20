class SessionsController < ApplicationController
  
  def new
    @title = "Sign in | Scratchboard"
  end
  
  def create
    user = User.authenticate(params[:session][:email],params[:session][:password])
    if user.nil?
      flash.now[:"alert alert-error"] = "Please try again. Invalid email or password."
      @title = "Log in | Scratchboard"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end

end