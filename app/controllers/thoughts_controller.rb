require 'rails_autolink'
class ThoughtsController < ApplicationController
  before_filter :authenticate

  def new
    @project = Project.find(params[:project_id])
    @thought = Thought.new if signed_in?
    @title = "New thought | Scratchboard"
  end
  
  def create
    @project = Project.find(params[:project_id])
    @thought = @project.thoughts.build(params[:thought])
    if @thought.save
      redirect_to @project 
    else
      render 'pages/home'
    end
  end
  
  def show
    @project = Project.find(params[:project_id])
    @thought = Thought.find(params[:id])
  end
  
end