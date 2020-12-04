Rails.application.routes.draw do
  devise_for :customers, controllers: { registrations: "registrations"}
  get 'pages/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/pages/:permalink' => "pages#permalink"
  get '/customers/:id' => "customers#show"


  resources :cart, only: %i[index create destroy]
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
