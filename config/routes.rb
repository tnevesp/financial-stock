Rails.application.routes.draw do
  resources :empresas

  resources :carteiras do
  	collection do
  		get :atualizar_precos

      resources :em_andamentos, only: [:index], module: :carteiras do
        collection do
          get :concentrado
        end
      end

      resources :encerradas, only: [:index], module: :carteiras
  	end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "carteiras/em_andamentos#index"

  resources :paineis, only: [:index]

  resources :wallets
end
