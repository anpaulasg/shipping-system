Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :delivery_modes, only: [:show, :new, :create, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create, :edit, :update]
  resources :price_weights, only: [:index, :new, :create, :edit, :update]
  resources :price_distances, only: [:index, :new, :create, :edit, :update]
  resources :consult_price_terms, only: [:index]
  resources :delivery_times, only: [:index, :new, :create, :edit, :update]
  
  resources :orders, only: [:new, :create, :show] do
    resources :order_shippings, only: [:new, :create]
    resources :close_orders, only: [:new, :create]
    post 'other', on: :member
    post 'address_unknown', on: :member
    post 'absent', on: :member
    post 'lost', on: :member
  end 

  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update] do 
    get 'search', on: :collection
    post 'repair', on: :member
    post 'transit', on: :member
    post 'transit', on: :member 
  end 
end