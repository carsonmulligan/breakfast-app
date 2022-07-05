Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'

  resources :restaurants
  resources :dishes, except: [:index]
  resources :tabs, only: [:new, :index, :show] do
    resources :dishes, only: [:index]
    resources :tab_dishes, only: [:create, :destroy]
    resources :split, only: [:show]
  end

  get 'tabs/:id/split', to: 'split#show'

  resources :bills, only: [:create, :show, :index] do
    resources :payments, only: :new
    resources :tab_dishes, only: [:index]
  end
  post "/bills_split", to: "bills#create_split"

  resources :bills_tab_dishes, only: [:index]

  resources :tab_dishes do
    member do
      post 'add_unit'
      # delete 'remove_unit'
      # post 'remove_unit'
    end
  end

  # get 'test/:tab_dish_id', to: 'tab_dishes#destroy', as: :test
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
