Rails.application.routes.draw do
  namespace :admin do
    resources :dashboards, only: :index
  end
end
