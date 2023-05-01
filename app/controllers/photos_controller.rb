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
    

  end
  

  def create_photo

    @image = params.fetch("input_image")
    @caption = params.fetch("input_caption")
    @owner_id = params.fetch("input_owner_id")

   new_photo = Photo.new

   new_photo.image = @image
   new_photo.caption = @caption
   new_photo.owner_id = @owner_id

   new_photo.save

    redirect_to("/photos/#{new_photo.id}")
    
  end

  def edit_photo
    
    @image = params.fetch("input_image")
    @caption = params.fetch("input_caption")
    
    @photo_id = params.fetch("photo_id")

    edited_photo = Photo.where({ :id => @photo_id}).at(0)

    edited_photo.image = @image
    edited_photo.caption = @caption
    
    edited_photo.save
    
    redirect_to("/photos/#{@photo_id}")
    
  end

  def edit_comment
    
    @author_id = params.fetch("author_id")
    @comment = params.fetch("new_comment")
    @photo_id = params.fetch("photo_id")

    new_comment = Comment.new
    new_comment.photo_id = @photo_id
    new_comment.body = @comment
    new_comment.author_id = @author_id
 
    new_comment.save

    
    redirect_to("/photos/#{@photo_id}")
    
  end

end
