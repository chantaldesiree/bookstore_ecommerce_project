Rails.application.routes.draw do
  devise_for :customers, controllers: { registrations: "registrations"}

  get '/customers/:id' => "customers#show"



  get 'pages/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/pages/:permalink' => "pages#permalink"

  scope "/checkout/" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "orders#create", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  get "/checkout/success", redirect("/")


  authenticate :customer do
  resources :cart, only: %i[index]
  end
  resources :cart, only: %i[create destroy]
  resources :orders, only: %i[index create destroy show]
  resources :years, only: %i[index show]
  resources :authors, only: %i[index show]
  resources :genres, only: %i[index show]
  resources :books, only: %i[index show search] do
    collection do
      get "search"
      get "new"
      get "sale"
    end
  end

  root "home#index"
end
