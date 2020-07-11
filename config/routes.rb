Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  post '/top/guest_sign_in', to: 'top#new_guest'
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
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
end

