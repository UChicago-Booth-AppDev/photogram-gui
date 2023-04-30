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
  
end
