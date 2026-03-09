Rails.application.routes.draw do
  resources :users, only: [ :create ]

  post "/login", to: "auth#login"

  get "/me", to: "users#me"

  get "up" => "rails/health#show", as: :rails_health_check
end
