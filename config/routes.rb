Rails.application.routes.draw do
  resources :users, only: [ :create ]
  resources :rooms, only: [ :index, :show, :create, :update, :destroy ]
  resources :rooms do
    member do
      post :invite
      delete :leave
    end
  end

  post "/login", to: "auth#login"

  get "/me", to: "users#me"

  get "up" => "rails/health#show", as: :rails_health_check
end
