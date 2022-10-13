Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :delivery_modes, only: [:show, :new, :create, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create, :edit, :update]
  resources :price_weights, only: [:index, :show, :new, :create, :edit, :update]
  resources :price_distances, only: [:index, :show, :new, :create, :edit, :update]
  resources :consult_price_terms, only: [:index]

  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update] do 
    get 'search', on: :collection
    post 'repair', on: :member
    post 'transit', on: :member 
  end 
end
