Rails.application.routes.draw do
  get 'items/new'
  get 'items/edit'
  devise_for :users
  root to: 'bundles#index', as: :home

  resources :bundles do
    member do
      resources :items, except: [:index, :show, :edit, :update]

      resources :bookings, only: [:new, :create]
    end
  end

  resources :bookings, only: [:index, :show, :update]
end
