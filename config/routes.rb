Rails.application.routes.draw do

  root "welcome#index"
  get "login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  get "logout" => "sessions#destroy", as: :logout
  resources :users do
    resources :rants
  end
  resource :dashboard, controller: :dashboard
end
