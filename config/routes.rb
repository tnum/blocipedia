Rails.application.routes.draw do

  devise_for :users

  resources :wikis
  resources :users, only:[:update, :show]

  root to: 'wikis#index'

  resources :charges, only: [:new, :create]

end
