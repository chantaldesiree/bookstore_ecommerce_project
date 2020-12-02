Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cart, only: %i[index create destroy]
  resources :authors, only: %i[index show]
  resources :books, only: %i[index show search] do
    collection do
      get "search"
    end
  end

  root "home#index"
end
