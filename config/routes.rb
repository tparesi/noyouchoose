Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resource :sessions, only: [:show, :create, :destroy]
    resources :users, only: [:index, :show, :create]
    resources :plans, only: [:create, :show, :index]
    resources :restaurants, only: [:show]
    resources :swipes, only: [:create, :show]
    resources :potential_restaurants, only: [:show]
    get "plans/:id/matches", to: "plans#matches"
  end

  get "/auth/:provider/callback", to: "sessions#omniauth"
  root to: "pages#root"
end
