Rails.application.routes.draw do
  resources :companies
  root to: 'admin/dashboards#index'

  devise_for :user, skip: :registrations

  namespace :admin do
    resources :dashboards, only: :index
  end

  namespace :reviewer do
    resources :dashboards, only: :index
  end
end
