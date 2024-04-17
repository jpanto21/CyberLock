Rails.application.routes.draw do
  # Root route
  root "home#home"

  # Devise routes for user authentication
  devise_for :users

  # Resourceful routes for other models
  resources :organizations
  resources :external_data
  resources :alerts 
  resources :interactions, only: [:index, :show]

  # Routes for Questions:
  # Route to show the form for a new question
  get 'questions/new', to: 'questions#new', as: 'new_question'
  # Route to handle the submission of the question
  post 'questions/ask', to: 'questions#ask', as: 'ask_question'
  # Route to display the answer to a question
  get 'questions/show/:id', to: 'questions#show', as: 'show_question'
  
  # Additional routes
  get 'check_breaches', to: 'api#check_breaches'
  # Route for user profiles
  get "/:username" => "users#show", as: :user
end
