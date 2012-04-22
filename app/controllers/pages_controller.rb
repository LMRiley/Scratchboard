class PagesController < ApplicationController

  def home
    @title = "Scratchboard"
    @project = Project.new if signed_in?
  end

  def about
    @title = "About Scratchboard"
  end
end