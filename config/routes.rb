Rails.application.routes.draw do
  # devise_for :users, :controllers => {:registrations => "registrations"}

  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
  # end
  # devise_scope :user do
  #   get 'signup', to: 'devise/registrations#new'
  # end
  root 'welcome#home'
  
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :posts, only: [:new, :create, :show, :index, :edit, :update] do
    resources :recipes, only: [:create]
  end

  get '/auth/facebook/callback' => 'sessions#create'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'

  delete 'session' => 'sessions#destroy', as: 'logout'

end
