Rails.application.routes.draw do
  root to: "horses#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :horses, except: [:index] do
    resources :bookings
  end
end
