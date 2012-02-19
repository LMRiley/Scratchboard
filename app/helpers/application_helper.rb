module ApplicationHelper
  
# return a title based on the page
  def title
    base_title = "Scratchboard"
      if @title.nil?
        base_title
      else
        @title
      end
  end
  
  def logo
    image_tag("logo.png", :alt => "Scratchboard", :class => ":round")
  end
  
end
