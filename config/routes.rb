Rails.application.routes.draw do

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]  
  end

  devise_for :users
  resources :users
  
  root to: 'wikis#index'

  resources :charges, only: [:new, :create]

end
