Rails.application.routes.draw do

  root to: 'vacancies#index'

  devise_for :user, skip: :registrations, controllers: { invitations: 'admin/users/invitations' }

  namespace :admin do
    resources :pipelines
    resources :vacancies
    resources :steps, except: [:index]
    resources :skills, except: [:index]
    resources :dashboards, only: [:index]
    resources :companies, only: [:edit, :update]
    resources :users, except: [:show, :edit]
    resources :applications
  end

  namespace :reviewer do
    resources :dashboards, only: :index
  end

  resources :vacancies, only: [:index, :show]
  resources :applications, only: [:new, :create]
end
