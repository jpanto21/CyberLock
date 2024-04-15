Rails.application.routes.draw do
  # Routes for the Alert resource:
  root "home#home"


  devise_for :users

  resources :organizations
  resources :external_data
  resources :alerts 


  get 'questions/new', to: 'questions#new', as: 'new_question'
  post 'questions/ask', to: 'questions#ask', as: 'ask_question'
  get 'questions/show', to: 'questions#show', as: 'show_question'
  
  get 'check_breaches', to: 'api#check_breaches'

  
  get "/:username" => "users#show", as: :user
 
  
end
