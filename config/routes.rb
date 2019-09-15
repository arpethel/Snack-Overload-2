Rails.application.routes.draw do
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create_with_facebook'

  resources :users, only: [:new, :create, :show]
  get 'signup' => 'users#new'

  resources :sessions, only: [:new, :create]
  get 'login' => 'sessions#new'
  
  delete 'session' => 'sessions#destroy', as: 'logout'
end
