Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'

  get 'profile', to: 'users#profile'
  get 'dashboard', to: 'users#dashboard'

<<<<<<< HEAD
  #création d'une nouvelle route pour avoir un url de type /users/1 qui redirige vers la page dashboard
  get '/users/:id', to: 'users#dashboarddd', as: 'user'

  # resources :user
  resources :nanny
=======
  resources :nannies
>>>>>>> 99c15536a2ec02c59020eced53ec95316cb24dd6
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :booking
  # get 'booking', to: 'users#booking'

  # root "bookings#index"

  resources :users do
    resources :nannies
    resources :bookings
  end


end
