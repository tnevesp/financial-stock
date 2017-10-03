Rails.application.routes.draw do
  resources :empresas
  resources :carteiras
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "carteiras#index"

  resources :wallets
end
