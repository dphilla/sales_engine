Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find", to: "search#show"
        get "/random", to: "search#rand"
        get "/find_all", to: "search#index"
      end

      namespace :items do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "search#rand"
        get "/merchant", to: "find_merchant#show"
      end

      resources :merchants, only: [:index, :show] do
        get "/items", to: "merchants/items#index"
      end
      resources :items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
