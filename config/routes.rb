Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'top#index'
  resources :posts do 
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show] 
  resources :tags, only: [:index, :show] do
    get 'posts', to: 'posts#show'
  end
  resources :relationships, only: [:create, :destroy]
end

