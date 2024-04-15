Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  
  resources :users, only: [:show]
  resources :englishes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :videos do
    resources :like2s, only: [:create, :destroy]
    resources :replies, only: [:create]
  end
  root 'hello#index' 
end

