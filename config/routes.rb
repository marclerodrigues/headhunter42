Rails.application.routes.draw do
  root to: 'admin/dashboards#index'
  resources :company_form, only: [:edit, :update]

  devise_for :user, skip: :registrations

  namespace :admin do
    resources :dashboards, only: :index
  end

  namespace :reviewer do
    resources :dashboards, only: :index
  end
end
