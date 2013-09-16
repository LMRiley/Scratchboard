class StoriesController < ApplicationController
  before_filter :authenticate

  def new
    @project = Project.find(params[:project_id])
    @story = Story.new if signed_in?
    @title = "New story | Scratchboard"
  end
  
  def create
    @project = Project.find(params[:project_id])
    @story = @project.stories.build(params[:story])
    if @story.save
      redirect_to @project 
    else
      render 'new'
    end
  end
  
  def show
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    if Ownership.find_by_project_id_and_user_id(@project.id, current_user.id)
      @story
    else
      redirect_to current_user
      flash[:"alert alert-warning"] = "Sorry - you do not have access to that story"
    end
  end
  
  def edit
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    if Ownership.find_by_project_id_and_user_id(@project.id, current_user.id)
      edit_project_story_path(@project.id, @story.id)
    else
      redirect_to current_user
      flash[:"alert alert-warning"] = "Sorry - you do not have access to that story"
    end
  end
  
  def update
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      redirect_to @project
      flash[:"alert alert-success"] = "Story updated"
    else
      redirect_to @project
      flash[:"alert alert-warning"] = "Sorry - there was a problem saving your edit"
    end
  end
    
  def destroy
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to @project
    flash[:"alert alert-success"] = "Story deleted!"
  end  
     
end