Rails.application.routes.draw do

  root "welcome#index"
  get "login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  get "logout" => "sessions#destroy", as: :logout
  get "/user/:user_id/rant/:rant_id/favorite" => "favorites#create", as: :favorite
  get "/user/:user_id/rant/:rant_id/unfavorite" => "favorites#destroy", as: :unfavorite
  get "/account_confirmation", to: "users#account_confirmation"



  resources :users do
    post "profile_comments" => "comments#create"
    resources :favorites, only: [:index]
    resources :follows
    resources :rants do
      post "rant_comments" => "comments#create"
    end
  end


  resources :confirmations, only: [:show]
  resource :dashboard, controller: :dashboard
  resources :hashtags, only: [:show]
  resource :search, only: [:new, :show]



end
