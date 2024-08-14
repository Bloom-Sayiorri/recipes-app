Rails.application.routes.draw do
  resources :profiles
  resources :reviews
  resource :profile, only: [:show, :update]
  resources :users

  post '/login', to: 'auth#create'
  post '/me', to: 'auth#me'
  get '/logged_in', to: 'application#logged_in?'
  delete '/logout', to: 'session#logout'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
