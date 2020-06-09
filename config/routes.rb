Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :posts
  resources :users, only: :show
end
