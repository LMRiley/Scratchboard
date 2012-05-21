class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @project = Project.find(params[:project_id])
    @thought = Thought.find(params[:thought_id])
    @comment = @thought.comments.build(params[:comment])
    @comment.user = current_user.name
    respond_to do |format|
        if @comment.save
           format.html { redirect_to(@project, :notice => 'Post created via non AJAX.') }
           format.js
        else
           redirect_to @project
        end
    end
  end

end