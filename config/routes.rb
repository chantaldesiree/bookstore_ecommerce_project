Rails.application.routes.draw do
  get 'home/index'
  get 'cart/index'
  get 'cart/create'
  get 'cart/destroy'
  get 'book/index'
  get 'book/show'
  get 'book/search'
  get 'author/index'
  get 'author/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
