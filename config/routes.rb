=begin Rails.application.routes.draw do
  resources :genres
  resources :favorites
  resources :users
  resources :reviews
   For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "events" => "events#index"
=end 

Rails.application.routes.draw do
  resources :genres
  get "signup" => "users#new"
  get "signin" => "sessions#new"
  resources :users
  resource :session
  root "movies#index"
  # get "movies"     => "movies#index"
  # get "movies/new" => "movies#new"
  # get "movies/:id" => "movies#show", as: "movie"
  # get "movies/:id/edit" => "movies#edit", as: "edit_movie"
  # patch "movies/:id" => "movies#update"

  # uses a built-in Rails convention to dynamically define a bunch of routes
  resources :movies do
    resources :reviews
    resources :favorites
  end

end
