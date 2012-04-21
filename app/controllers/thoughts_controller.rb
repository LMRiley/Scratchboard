class ThoughtsController < ApplicationController
  before_filter :authenticate

  def new
    @project = Project.find(params[:project_id])
    @thought = Thought.new if signed_in?
  end
  
  def create
    @project = Project.find(params[:project_id])
    @thought = @project.thoughts.build(params[:thought])
    if @thought.save
      flash[:success] = "Thought created!" 
      redirect_to @project 
    else
      render 'pages/home'
    end
  end
  
end