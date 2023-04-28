Rails.application.routes.draw do
  get '/movies', to: "movies#index"
  namespace :admin do
    resources :movies, only: [:index, :new, :create]
    get 'movies', to: "movies#index"
  end
end
