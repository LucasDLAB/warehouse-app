Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :warehouses, only: [:show, :new, :create]
  resources :suppliers, only: [:index, :show, :new, :create, :edit, :update]
  # Defines the root path route ("/")
  # root "articles#index"
end
