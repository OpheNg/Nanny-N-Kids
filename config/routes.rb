Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'

  get 'profile', to: 'users#profile'

  get'search_a_nanny', to: 'users#search_a_nanny'
  get 'nanny_index', to: 'users#nanny_index'

  # A supprimer ??
  get 'dashboard', to: 'users#dashboard'

  #création d'une nouvelle route pour avoir un url de type /users/1 qui redirige vers la page dashboard
  get '/users/:id', to: 'users#dashboard', as: 'user'


  resources :nannies

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :booking
  # get 'booking', to: 'users#booking'

  # root "bookings#index"

  # resources :users do
  #   resources :nannies
    resources :bookings
  # end

  resources :nannies do
    resources :bookings, only: [ :new, :create ]
  end


end
