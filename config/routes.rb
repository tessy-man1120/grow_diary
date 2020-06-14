Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }


  root to: 'top#index'
  resources :posts do 
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :index]
  resources :tags

end