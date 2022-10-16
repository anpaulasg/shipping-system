Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :delivery_modes, only: [:show, :new, :create, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create, :edit, :update]
  resources :price_weights, only: [:index, :new, :create, :edit, :update]
  resources :price_distances, only: [:index, :new, :create, :edit, :update]
  resources :consult_price_terms, only: [:index]
  resources :delivery_times, only: [:index, :new, :create, :edit, :update]
  
  resources :orders, only: [:new, :create] do
    resources :order_shippings, only: [:new, :create]
    post 'pending', on: :member
    post 'initiated', on: :member
    post 'terminated', on: :member
  end 

  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update] do 
    get 'search', on: :collection
    post 'repair', on: :member
    post 'transit', on: :member 
  end 
end
