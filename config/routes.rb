Rails.application.routes.draw do
  get 'bills/index'
  get 'bills/show'
  get 'bills/create'
  devise_for :users
  root to: 'pages#home'

  resources :restaurants
  resources :dishes, except: [:index]
  resources :tabs, only: [:index, :show] do
    resources :dishes, only: [:index]
    resources :tab_dishes, only: [:create]
  end
  resources :bills, only: [:create, :show, :index] do
    resources :payments, only: :new
  end

  resources :tab_dishes, except: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
