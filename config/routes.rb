Rails.application.routes.draw do
  resources :restaurants do
      get "filter", on: :collection
  end

end
