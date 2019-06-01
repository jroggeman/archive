Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "documents#index"

  resources :documents
  resources :users

  # Authentication
  get '/login',  to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout', as: 'logout'
end
