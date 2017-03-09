Rails.application.routes.draw do
  
  devise_for :users
  
  root 'static_pages#index'
  
  resources :reviews
  resources :movies
  resources :users do
    resources :relationships, only: [:create, :destroy]
  end
end
