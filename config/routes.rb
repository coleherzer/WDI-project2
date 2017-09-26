Rails.application.routes.draw do
  root "users#index"

  resources :users

  resources :sessions, only: [:new, :create]

  delete '/logout' => 'sessions#destroy', as: :logout

  resources :exercises

  resources :diets
  
end
