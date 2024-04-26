Rails.application.routes.draw do
  # Root route
  root "home#home"

  # Devise routes for user authentication
  devise_for :users

  # Resourceful routes for other models
  resources :organizations
  resources :external_data
  resources :alerts 
  resources :interactions 

  post 'interactions/ask', to: 'interactions#ask', as: 'ask_question'
  
  # Additional routes
  get 'check_breaches', to: 'api#check_breaches'
  # Route for user profiles
  get "/:username" => "users#show", as: :user
end
