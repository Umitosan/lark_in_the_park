Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "states#index"

  resources :states
  resources :parks

  get '/parks_search' => 'parks#search'
  get '/random_park' => 'parks#random'

end
