module ApplicationHelper

  def title
    base_title = "Scratchboard"
      if @title.nil?
        base_title
      else
        @title
      end
  end
  
  def logo
    image_tag("logo.png", :alt => "Scratchboard")
  end
  
  def logo_small
    image_tag("mark.jpg", :alt => "Scratchboard")
  end
  
  def file_icon
    image_tag("download.png", :alt => "Get file", :class => 'thumbnail')
  end
  
end