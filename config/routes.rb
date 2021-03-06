Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  post '/top/guest_sign_in', to: 'top#new_guest'
  root to: 'top#index'
  resources :posts do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
    collection do
      get 'search'
      get 'rank'
    end
  end

  resources :users, only: [:show]
  resources :groups
  resources :tags, only: %i[index show] do
    get 'posts', to: 'posts#show'
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
end
