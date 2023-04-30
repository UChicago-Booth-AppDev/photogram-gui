class UsersController < ActionController::Base

  def index

    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "user_templates/index.html.erb"})
  end

  def show_user
    
    @user_name = params.fetch(:username)

    @user  = User.where({ :username => @user_name}).at(0)

    @user_id = @user.id

    @posted_photos = Photo.where ({:owner_id => @user_id})

    
    render({:template => "/user_templates/show_user.html.erb"})
  end
  
end
