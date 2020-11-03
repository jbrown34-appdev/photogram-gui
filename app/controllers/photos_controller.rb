class PhotosController < ApplicationController
  
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc})

    render({ :template => "photo_templates/index.html.erb"})
    
  end

  def show
    url_id = params.fetch("path_photo")
    matching_photos = Photo.where({ :id => url_id})
    @the_photo = matching_photos.at(0)
    render({ :template => "photo_templates/show.html.erb"})
  end

  def destroy
    the_id = params.fetch("toast_photo")
    matching_photos= Photo.where({ :id => the_id})
    the_photo= matching_photos.at(0)
    the_photo.destroy

    #render({ :template => "photo_templates/destroy.html.erb"}) dont need to do this. 
    redirect_to("/photos")
  end

  def append
    
    render({ :template => "photo_templates/append.html.erb"})
    #redirect_to("/photos")
  end

end 