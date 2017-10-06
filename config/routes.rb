Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find", to: "search#show"
        get "/random", to: "search#rand"
        get "/find_all", to: "search#index"
        get "/most_revenue", to: "most_revenue#index"
        get "/most_items", to: "most_items#index"
        get "/revenue", to: "total_revenue_by_date#show"
      end

      namespace :items do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "search#rand"
        get "/merchant", to: "find_merchant#show"
      end

      namespace :transactions do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "search#rand"
      end

      namespace :invoices do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "search#rand"
      end

      namespace :customers do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "search#rand"
      end


      namespace :invoice_items do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "search#rand"
      end
##############
      resources :merchants, only: [:index, :show] do
        get "/items", to: "merchants/items#index"
        get "/invoices", to: "merchants/invoices#index"
        get "revenue", to: "merchants/total_revenue_by_merchant#show"
      end

      resources :items, only: [:index, :show] do
        get "/invoice_items", to: "items/invoice_item#index"
        get "/merchant", to: "items/merchant#index"
      end

      resources :transactions, only: [:index, :show] do
        get "/invoice", to: "transactions/invoice#show"
      end

      resources :customers, only: [:index, :show] do
        get "/invoices", to: "customers/invoices#index"
        get "/transactions", to: "customers/transactions#index"
      end


      resources :invoices, only: [:index, :show] do
        get "/transactions", to: "invoices/transactions#index"
        get "/invoice_items", to: "invoices/invoice_items#index"
        get "/items", to: "invoices/items#index"
        get "/customer", to: "invoices/customer#index"
        get "/merchant", to: "invoices/merchant#index"
      end


      resources :invoice_items, only: [:index, :show] do
        get "/invoice", to: "invoice_items/invoice#index"
        get "/item", to: "invoice_items/item#index"
      end

    end
  end
end
