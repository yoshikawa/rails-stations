Rails.application.routes.draw do
  resources :reservations
  resources :schedules
  get "/movies", to: "movies#index"
  get "/sheets", to: "sheets#index"
  get 'sheets/index'
  namespace :admin do
    resources :movies, only: [:create, :update, :destroy]
    get '/movies/', to: "movies#index"
    get '/movies/:id/', to: "movies#edit"
    resources :schedules, only: [:create, :update, :destroy]
    get '/schedules/', to: "schedules#index"
    get '/schedules/:id/', to: "schedules#edit"
    get '/movies/:id/schedules/new', to: "schedules#new"
  end
  resources :movies do
    member do
      get 'reservation'
    end 
  end
  get '/movies/:movie_id/schedules/:schedule_id/reservations/new', to: "reservations#new"
end