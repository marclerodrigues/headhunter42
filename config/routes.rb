Rails.application.routes.draw do
  root to: 'home#index'

  # root to: 'admin/dashboards#index'
  devise_for :user, skip: :registrations

  namespace :admin do
    resources :dashboards, only: :index
    resources :companies, only: [:edit, :update]
  end

  namespace :reviewer do
    resources :dashboards, only: :index
  end
end
