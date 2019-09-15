Rails.application.routes.draw do
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create_with_facebook'

  resources :users, only: [:new, :create, :show]
  get 'signup' => 'users#new'
end
