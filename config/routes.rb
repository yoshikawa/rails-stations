Rails.application.routes.draw do
  get "/movies", to: "movies#index"
  get "/sheets", to: "sheets#index"
  get 'sheets/index'
  namespace :admin do
    resources :movies, only: [:create, :update, :destroy]
    get '/movies/', to: "movies#index"
    get '/movies/:id/edit', to: "movies#edit"
  end
end