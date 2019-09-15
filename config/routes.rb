Rails.application.routes.draw do
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create_with_facebook'
end
