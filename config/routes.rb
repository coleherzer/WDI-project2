Rails.application.routes.draw do
  root "users#index"

  resources :users

  resources :sessions, only: [:new, :create]

  delete '/logout' => 'sessions#destroy', as: :logout

  resources :exercises

  resources :diets

  resources :goals

  # need to add routes for the days controller

  get '/day' => 'days#show'
  
end
