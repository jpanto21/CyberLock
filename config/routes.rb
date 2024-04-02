Rails.application.routes.draw do
  # Routes for the Alert resource:
  root "organizations#index"

  devise_for :users

  resources :organizations
  resources :external_data
  resource :alerts



  # # CREATE
  # post("/insert_alert", { :controller => "alerts", :action => "create" })
          
  # # READ
  # get("/alerts", { :controller => "alerts", :action => "index" })
  
  # get("/alerts/:path_id", { :controller => "alerts", :action => "show" })
  
  # # UPDATE
  
  # post("/modify_alert/:path_id", { :controller => "alerts", :action => "update" })
  
  # # DELETE
  # get("/delete_alert/:path_id", { :controller => "alerts", :action => "destroy" })

  #------------------------------


end
