Rails.application.routes.draw do
  root to: 'pets#index'
  resources :pets, only: :index
end
