Rails.application.routes.draw do
  # Routes for the Alert resource:

  # CREATE
  post("/insert_alert", { :controller => "alerts", :action => "create" })
          
  # READ
  get("/alerts", { :controller => "alerts", :action => "index" })
  
  get("/alerts/:path_id", { :controller => "alerts", :action => "show" })
  
  # UPDATE
  
  post("/modify_alert/:path_id", { :controller => "alerts", :action => "update" })
  
  # DELETE
  get("/delete_alert/:path_id", { :controller => "alerts", :action => "destroy" })

  #------------------------------

  resources :organizations
  resources :external_data
  devise_for :users
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   
  # Defines the root path route ("/")
  # root "articles#index"
end
