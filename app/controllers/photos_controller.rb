class PhotosController < ActionController::Base

  def index

    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})
    render({ :template => "photo_templates/index.html.erb"})
  end
  
  def show_photo
    
    @photo_id = params.fetch("photo_id")

    @photo  = Photo.where({ :id => @photo_id}).at(0)

    if @photo == nil
      redirect_to("/404")
    else
    render({:template => "/photo_templates/show_photo.html.erb"})
    end
  end

  def delete_photo

    @photo_id = params.fetch("photo_id")

    matching_photos = Photo.where({ :id => @photo_id}) 
    
    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")
    
    # render({:template => "/photo_templates/delete_photo.html.erb"})

  end
  
end
