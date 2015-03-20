Rails.application.routes.draw do

  devise_for :users
  resources :users 
  resources :medicines 

  
  #resources :messages
  get '/profile', to: 'users#profile'
  
  root 'welcome#index'
end


