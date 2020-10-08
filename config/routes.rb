Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  get 'analysis/index'
  get 'analysis/positive'
  get 'analysis/negative'
  
  root to: 'things#index'
 
   get 'signup', to: 'users#new'
 
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

 
 resources :things
 resources :users, only: [:new, :create]
end
