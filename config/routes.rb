Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  devise_scope :user do
  authenticated :user do
    root 'users#profile', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end

  resources :users 
  resources :medicines 

  get '/profile', to: 'users#profile'
  
  #root 'welcome#index'
end


