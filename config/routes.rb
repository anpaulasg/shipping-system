Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :delivery_modes, only: [:show, :new, :create, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create, :edit, :update]

  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update] do 
    get 'search', on: :collection
  end 
end
