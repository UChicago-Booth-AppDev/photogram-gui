Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:username", { :controller =>"users", :action => "show_user"})

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:photo_id", { :controller =>"photos", :action => "show_photo"})

  get("/delete_photo/:photo_id", { :controller =>"photos", :action => "delete_photo"})

  get("/create_photo", { :controller =>"photos", :action => "create_photo"})

  get("/edit_photo/:photo_id", { :controller =>"photos", :action => "edit_photo"})


end
