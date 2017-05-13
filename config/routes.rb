Rails.application.routes.draw do

  resources:providers
  resources:jobs
  resources:contacts
  resources:users
  #resourceful route declares routes for index, show, new, edit, create, update and destroy actions

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
