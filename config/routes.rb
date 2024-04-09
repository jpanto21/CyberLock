Rails.application.routes.draw do
  # Routes for the Alert resource:
  root "home#home"


  devise_for :users

  resources :organizations
  resources :external_data
  resources :alerts 
  
  get 'check_breaches', to: 'api#check_breaches'


  get "/:username" => "users#show", as: :user
 
  
end
