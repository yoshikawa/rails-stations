Rails.application.routes.draw do
  get '/movies', to: "movies#index"
  namespace :admin do
    resources :movies
    get 'movies', to: "movies#index"
  end
end
