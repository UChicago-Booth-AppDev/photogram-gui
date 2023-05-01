class UsersController < ActionController::Base

  def index

    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "user_templates/index.html.erb"})
  end

  def show_user
    
    @user_name = params.fetch("username")

    @user  = User.where({ :username => @user_name}).at(0)

    if @user == nil
      redirect_to("/404")
    else
    render({:template => "/user_templates/show_user.html.erb"})
    end
  end
  
  def add_user
    
   @new_user_username = params.fetch("new_user")
   
   @new_user = User.new

   @new_user.username = @new_user_username

   @new_user.save

   redirect_to("/users/#{@new_user_username}")

  end

  def update_user
    
    @old_username = params.fetch("username")
    @updated_username = params.fetch("new_username")
    
    @user = User.where({ :username => @old_username}).at(0)

    @user.username = @updated_username
 
    @user.save
 
    redirect_to("/users/#{@updated_username}")
 
   end
end
