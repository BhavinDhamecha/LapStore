Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations, :passwords]

	devise_scope :user do
    get 		'/signin', 					to: 'devise/sessions#new', 					as: 'new_user_session'
    post 		'/signin', 					to: 'devise/sessions#create', 			as: 'user_session'

    delete 	'/signout', 				to: 'devise/sessions#destroy', 			as: 'destroy_user_session'
    
    get 		'/signup', 					to: 'devise/registrations#new',			as: 'new_user_registration'
    post		'/signup',					to: 'devise/registrations#create', 	as: 'user_registration' 	
    put			'/signup',					to: 'devise/registrations#update', 	as: 'registration_path'
    delete	'/signup',					to: 'devise/registrations#destroy', as: 'destroy_user'
    get			'/edit-user',				to: 'devise/registrations#edit',		as: 'edit_user_registration'
    
    get			'/forgot-password',	to: 'devise/passwords#new', 				as: 'new_user_password'
    post		'/forgot-password',	to: 'devise/passwords#create',			as: 'user_password'
    get			'/edit-password', 	to: 'devise/passwords#edit',				as: 'edit_user_password'
    put			'/forgot-password', to: 'devise/passwords#update',			as: 'password_path'
  end

	root to: 'laptops#index'

  resources :laptops
  resources :categories
  resources :payments
  resources :orders
  resources :customers
  resources :brands

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
