Rails.application.routes.draw do
  resources :artist_performances
  resources :performances
  resources :shows
  resources :venues
  resources :artists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'shows#index'
end
