Rails.application.routes.draw do
  resources :people do
    resources :addresses
    resources :emails
    resources :phone_numbers
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
