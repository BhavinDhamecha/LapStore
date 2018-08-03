Rails.application.routes.draw do
  devise_for :users	

	root to: 'laptops#index'

  resources :laptops
  resources :categories
  resources :payments
  resources :orders
  resources :customers
  resources :brands

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
