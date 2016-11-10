Rails.application.routes.draw do
  #Set suppliers#index as root route
  root 'suppliers#index'
  #resources :tags
  resources :suppliers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
