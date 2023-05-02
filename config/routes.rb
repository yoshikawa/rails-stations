Rails.application.routes.draw do
  resources :schedules
  get "/movies", to: "movies#index"
  resources :movies, only: [:show, :update, :destroy]
  get "/sheets", to: "sheets#index"
  get 'sheets/index'
  namespace :admin do
    resources :movies, only: [:create, :update, :destroy]
    get '/movies/', to: "movies#index"
    get '/movies/:id/edit', to: "movies#edit"
  end
end