Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', action: :hello, controller: 'application'

  namespace :api do
    namespace :v1 do
      # User
      resources :users, param: :account_id, only: [:show], controller: 'users'
      resources :users, param: :uid, only: [:create], controller: 'users' do
        member do #users/:uid
          resources :wishes, only: [:index, :create, :update], controller: 'users/wishes'
          resources :friends, only: [:index, :create], controller: 'users/friends'
          resources :friend_wishes, only: [:index], controller: 'users/friend_wishes'
          resources :images, only: [:create], controller: 'users/images'
        end
      end
      # Category
      resources :categories, only: [:index, :create], controller: 'categories'
    end
  end
end
