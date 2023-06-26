Rails.application.routes.draw do
  root 'movies#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :screens
  resources :reservations
  resources :schedules
  get '/movies', to: 'movies#index'
  get '/sheets', to: 'sheets#index'
  get 'sheets/index'
  namespace :admin do
    resources :movies, only: %i[index show new create edit update destroy]
    get '/movies/', to: 'movies#index'
    get '/movies/:id/', to: 'movies#edit'
    resources :schedules, only: %i[index show new create edit update destroy]
    get '/schedules/', to: 'schedules#index'
    get '/schedules/:id/', to: 'schedules#edit'
    get '/movies/:id/schedules/new', to: 'schedules#new'
    resources :screens, only: [:index] do
      resources :sheets, only: [:index]
    end
    resources :reservations, only: [:new]
  end
  resources :movies do
    member do
      get 'reservation'
    end
  end
  get '/movies/:movie_id/schedules/:schedule_id/reservations/new', to: 'reservations#new'
end
