Rails.application.routes.draw do
  root to: "horses#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :horses do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index edit update]
end
