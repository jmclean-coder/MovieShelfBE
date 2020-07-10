Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # namespace :api do
  #   namespace :v1 do
      resources :movies
      resources :shelves
      resources :users
      resources :movie_shelves, only: [:index, :destroy] 
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      get '/movies', to: 'movies#index'
      # get '/movies/:id', to: 'movies#show'
      # get '/shelves', to: 'shelves#index'
      # get '/shelves/:id', to: 'shelves#show'
end
