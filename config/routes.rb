Rails.application.routes.draw do

  root 'pages#welcome'

  resources :providers, :jobs, :contacts, :users
  #resourceful route declares routes for index, show, new, edit, create, update and destroy actions

  get 'register', to: 'providers#new'
  # allows us to use a single resource to map /register to provider#new action

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
