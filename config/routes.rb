Rails.application.routes.draw do
  resources :reservations
  resources :schedules
  get "/movies", to: "movies#index"
  get "/sheets", to: "sheets#index"
  get 'sheets/index'
  namespace :admin do
    resources :movies, only: [:index,:show,:new,:create,:edit,:update,:destroy]
    get '/movies/', to: "movies#index"
    get '/movies/:id/', to: "movies#edit"
    resources :schedules, only: [:index,:show,:new,:create,:edit,:update,:destroy]
    get '/schedules/', to: "schedules#index"
    get '/schedules/:id/', to: "schedules#edit"
    get '/movies/:id/schedules/new', to: "schedules#new"
    resources :reservations, only: [:index,:show,:new,:create,:edit,:update,:destroy]
  end
  resources :movies do
    member do
      get 'reservation'
    end 
  end
  get '/movies/:movie_id/schedules/:schedule_id/reservations/new', to: "reservations#new"
end