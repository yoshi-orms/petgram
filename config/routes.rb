Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :pets
  resources :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
end
