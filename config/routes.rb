Rails.application.routes.draw do

  resources :providers, :jobs, :contacts, :users
  #resourceful route declares routes for index, show, new, edit, create, update and destroy actions

  # get 'profile' to :show, controller 'providers'
  # will allow us to map a singular resource to map /profile to show action

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
