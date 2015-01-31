Rails.application.routes.draw do

  resources :wikis

  devise_for :users
  resources :users
  
  root to: 'wikis#index'

  resources :charges, only: [:new, :create]

end
