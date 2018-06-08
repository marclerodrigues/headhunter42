Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :user, skip: :registrations, :controllers => { :invitations => 'admin/users/invitations' }

  namespace :admin do
    resources :dashboards, only: :index
    resources :companies, only: [:edit, :update]
    resources :users, only: [:index, :new, :create, :destroy]
  end

  namespace :reviewer do
    resources :dashboards, only: :index
  end
end
