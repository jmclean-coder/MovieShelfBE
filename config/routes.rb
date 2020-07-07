Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :movies
      resources :shelves
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
end
