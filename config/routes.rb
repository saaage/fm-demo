Rails.application.routes.draw do

  root 'pages#welcome'

  resources :providers, :jobs, :contacts, :clients, :users
  #resourceful route declares routes for index, show, new, edit, create, update and destroy actions

  get 'search', to: 'pages#search'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'dashboard', to: 'pages#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
