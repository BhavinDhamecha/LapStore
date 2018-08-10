Rails.application.routes.draw do

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

	root to: 'laptops#index'

  resources :laptops do
    get 'edit', on: :member
  end
  resources :categories do
    get 'index', on: :collection
  end
  resources :payments
  resources :orders
  resources :customers
  resources :brands

  # get '/404', to: 'application#record_not_found'
  # get '/500', to: 'application#record_not_found' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
