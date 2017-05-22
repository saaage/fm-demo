Rails.application.routes.draw do

  get 'users/new'

  root 'pages#login'

  resources :providers, :jobs, :contacts, :clients, :users
  #resourceful route declares routes for index, show, new, edit, create, update and destroy actions

  get 'register', to: 'providers#new'
  # allows us to use a single resource to map /register to provider#new action
  get 'search', to: 'pages#search'
  get 'dashboard', to: 'pages#home'

end
