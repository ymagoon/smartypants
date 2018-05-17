Rails.application.routes.draw do
  devise_for :users
  root to: 'bundles#index', as: :home

  resources :bundles do
    resources :bookings, only: [:new, :create]
    resources :items, except: [:index, :show, :edit, :update]
  end

  resources :bookings, only: [:index, :show] do
    member do
      patch 'approve', to: 'bookings#approve', as: :approve
      patch 'deny', to: 'bookings#deny', as: :deny
    end
  end
end
