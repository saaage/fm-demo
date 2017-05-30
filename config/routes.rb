Rails.application.routes.draw do

  root 'pages#login'

  resources :providers, :jobs, :contacts, :clients, :users
  #resourceful route declares routes for index, show, new, edit, create, update and destroy actions

  get 'search', to: 'pages#search'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'dashboard', to: 'pages#home'

end
