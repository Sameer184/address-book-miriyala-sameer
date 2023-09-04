Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'

  root "sessions#new"

  resources :users, only: [:new, :create]


  resources :people do
    resources :addresses
    resources :emails
    resources :phone_numbers
  end

  namespace :api do
    namespace :v1 do
      resources :people do
        resources :addresses
        resources :emails
        resources :phone_numbers
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
