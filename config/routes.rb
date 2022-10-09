Rails.application.routes.draw do
  root to: 'home#index'
  resources :delivery_modes, only: [:show, :new, :create, :edit, :update]
  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update]
end
