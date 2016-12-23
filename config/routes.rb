Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 # resources :users do

  #		resources :tasks
  
  #end	
  root 'tasks#index'
  resources :tasks do

  		resources :lists
  
  end	

  resources :lists do

  		resources :lists
  end



end
