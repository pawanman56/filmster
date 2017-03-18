Rails.application.routes.draw do
  
  devise_for :users
  
  root 'static_pages#index'
  
  resources :reviews do
    resources :votes, only: [:create, :destroy]
  end
  resources :movies
  resources :users do
    resources :relationships, only: [:create, :destroy]
  end
  
  get 'timeline' => 'users#timeline'
end
