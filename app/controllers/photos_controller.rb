class PhotosController < ApplicationController
  
  def index
    render({ :template => "photo_templates/index.html.erb"})
    
  end

  def show
    render({ :template => "photo_templates/show.html.erb"})
  end


end 