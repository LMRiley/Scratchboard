class ProjectsController < ApplicationController
  before_filter :authenticate
  
  def create
    @project = Project.create!(params[:project])
    if @project.save
      @ownership = Ownership.create!(user_id: current_user.id, project_id: @project.id)
      redirect_to @project
    else
      render 'new'
      flash[:"alert alert-danger"] = "Oops. There was a problem saving the project"
    end
  end
  
  def show
    @project = Project.find(params[:id])
    @title = @project.title
    @thoughts = @project.thoughts
    @stories = @project.stories
    if Ownership.find_by_project_id_and_user_id(@project.id, current_user.id)
      @project
    else
      redirect_to current_user
      flash[:"alert alert-warning"] = "Sorry - you do not have access to that project"
    end
  end
  
  def new
    @project = Project.new if signed_in?
    @user = current_user
    @title = "New project | Scratchboard"
  end
  
  def edit
    @project = Project.find(params[:id])
    @title = @project.title
    @thoughts = @project.thoughts
    if Ownership.find_by_project_id_and_user_id(@project.id, current_user.id)
      @project
    else
      redirect_to current_user
      flash[:"alert alert-warning"] = "Sorry - you do not have access to that project"
    end
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project
    else
      redirect_to @project
      flash[:"alert alert-warning"] = "Sorry - there was a problem saving your edit"
    end
  end
  
  def collaborators
    @users = User.all
    @project = Project.find(params[:id])
    @title = 'Project Collaborators'
  end

  def destroy
  end
end