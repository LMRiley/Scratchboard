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
    image_tag("mark.png", :alt => "Scratchboard")
  end
  
  def file_icon
    image_tag("download_3.png", :alt => "Get file", :style => 'thumb')
  end
  
end