class PagesController < ApplicationController

  def home
  end

  def about
    @title = "About Scratchboard"
  end
end