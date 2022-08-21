Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'account', to: 'pages#account'
  get 'dashboard', to: 'pages#dashboard'

  resources :user
  resources :nanny
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
