=begin Rails.application.routes.draw do
  resources :users
  resources :reviews
   For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "events" => "events#index"
=end 

Rails.application.routes.draw do
  resources :users
  root "movies#index"
  # get "movies"     => "movies#index"
  # get "movies/new" => "movies#new"
  # get "movies/:id" => "movies#show", as: "movie"
  # get "movies/:id/edit" => "movies#edit", as: "edit_movie"
  # patch "movies/:id" => "movies#update"

  # uses a built-in Rails convention to dynamically define a bunch of routes
  resources :movies do
    resources :reviews
  end

end
