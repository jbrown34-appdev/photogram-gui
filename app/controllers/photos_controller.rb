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

  def create
    #"input_image"=>"", "input_caption"=>"", "input_owner_id"=>""
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    owner_id = params.fetch("input_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = owner_id

    a_new_photo.save

    redirect_to("/photos/#{a_new_photo.id}")
  end

   def update
    #Parameters: {"input_image"=>"https://robohash.org/suntprovidentassumenda.png?size=300x300&set=set1", "input_caption"=>"All dwarfs are bastards in their father's eyes", "modify_id"=>"695"}
    photo_id = params.fetch("modify_id")
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    
    matching_photos= Photo.where({ :id => photo_id})
    the_photo= matching_photos.at(0)

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/#{the_photo.id}")
  end

end 