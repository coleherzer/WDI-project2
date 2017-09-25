Rails.application.routes.draw do
  resources :users

  resources :sessions, only: [:new, :create]

  delete '/logout' => 'sessions#destroy', as: :logout

  resources :exercises
  
end
