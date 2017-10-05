Rails.application.routes.draw do
  get 'pos', to: 'pos#index'

  resources :stock_categories
  resources :customers

  resources :stocks
  resources :posts
  resources :store_configurations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stock_categories#index'
end
