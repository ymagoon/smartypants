Rails.application.routes.draw do
  devise_for :users
  root to: 'bundles#index', as: :home

  resources :bundles do
    resources :items, except: [:index, :show, :edit, :update]
    resources :bookings, only: [:new, :create]
    member do
      get 'top', to: 'bundles#top'
      patch 'approve', to: 'bundles#approve'
    end
  end

  resources :bookings, only: [:index, :show, :update]
end
