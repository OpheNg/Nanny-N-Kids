Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'

  get 'profile', to: 'users#profile'
  get '/users/:id', to: 'users#dashboard', as: 'user'

  get'search_a_nanny', to: 'users#search_a_nanny'
  get 'nanny_index', to: 'nanny#index'



  # resources :user
  resources :nanny
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :booking
  # get 'booking', to: 'users#booking'

  # root "bookings#index"

  resources :bookings do
    resources :nannies
    resources :users
  end

end
