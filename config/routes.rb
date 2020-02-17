Rails.application.routes.draw do
  get 'bookings/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :stuffs do
    resources :bookings, only: %i(create) 
  end
end
