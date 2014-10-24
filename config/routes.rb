Rails.application.routes.draw do

  root "welcome#index"
  get "login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  get "logout" => "sessions#destroy", as: :logout
  get "/user/:user_id/rant/:rant_id/favorite" => "favorites#create", as: :favorite
  get "/user/:user_id/rant/:rant_id/unfavorite" => "favorites#destroy", as: :unfavorite


  resources :users do
    resources :favorites, only: [:index]
    resources :follows
    resources :rants do
    end
  end

  resource :dashboard, controller: :dashboard
  resources :search
  resources :hashtags, only: [:show]
end
