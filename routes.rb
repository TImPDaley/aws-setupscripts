Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'visitors#index'
  # User sign up screen
  get 'signup' => 'users#new'
  # Used for activation of new accounts - email confirmation etc
  resources :account_activations, only: [:edit]
  # Used for resetting a password for an account - email update etc
  resources :password_resets, only: %i[new create edit update]
  # Session Routes for login and logout
  get    'login',       to: 'sessions#new'
  post   'login',       to: 'sessions#create'
  delete 'logout',      to: 'sessions#destroy'
  resources :users
  #######################
  
end
