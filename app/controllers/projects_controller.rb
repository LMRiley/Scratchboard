class ProjectsController < ApplicationController
  before_filter :authenticate
  
  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      redirect_to current_user
    else
      render 'new'
    end
  end
  
  def show
    @project = Project.find(params[:id])
    @title = @project.title
    @thoughts = @project.thoughts
  end
  
  def new
    @project = Project.new if signed_in?
    @user = current_user
    @title = "New project | Scratchboard"
  end
  
  def destroy
  end
end