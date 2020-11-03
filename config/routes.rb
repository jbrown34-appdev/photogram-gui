Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_photo", { :controller => "photos", :action => "show" })
  get("/delete_photo/:toast_photo", { :controller => "photos", :action => "destroy" })

  get("/insert_photo_record", { :controller => "photos", :action => "create" })

end
