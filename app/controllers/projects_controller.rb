class ProjectsController < ApplicationController
  before_filter :authenticate
  
  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:success] = "Project created!"
      redirect_to current_user
    else
      render 'pages/home'
    end
  end
  
  def new
    @project = Project.new if signed_in?
    @user = current_user
  end
  
  def destroy
  end
end