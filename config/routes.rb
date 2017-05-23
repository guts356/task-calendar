Rails.application.routes.draw do

  #root to: 'calendar#index'
  #get 'calendar/index'
  root to: 'toppages#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  resources :tasks
  get 'events', to: 'event#events'
end
