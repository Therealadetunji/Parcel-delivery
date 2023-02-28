Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :parcels, only: [:index, :create, :show, :destroy]
      end
    namespace :v2 do
      resources :recipients, only: [:index, :create, :show, :destroy]
    end
    namespace :v3 do
      resources :users, only: [:index, :create, :destroy]
    end
  end
end
