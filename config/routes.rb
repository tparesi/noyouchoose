Rails.application.routes.draw do
  resources :restaurants do
      get "filter", on: :collection
  end

  namespace :api, defaults: { format: :json } do
    resource :sessions, only: [:show, :create, :destroy]
    resources :users, only: [:index, :show, :create]
  end

  get "/auth/:provider/callback", to: "sessions#omniauth"

  root to: "pages#root"
end
