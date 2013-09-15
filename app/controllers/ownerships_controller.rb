class OwnershipsController < ApplicationController
  
  def create
      @project = Project.find(params[:ownership][:project_id])
      @user = User.find(params[:ownership][:user_id])
      Ownership.create(user_id: @user.id, project_id: @project.id)
      redirect_to collaborators_project_path(@project)
  end
  
  def destroy 
     @ownership = Ownership.find(params[:id])
     @project = Project.find(@ownership.project_id)
     @ownership.destroy
     redirect_to collaborators_project_path(@project)
  end

end