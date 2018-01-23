# frozen_string_literal: true

Rails.application.routes.draw do
  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end

  root 'pages#home'

  get 'home' => 'pages#home'
  get 'dashboard' => 'pages#dashboard'

  post 'requests/user_position'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :maintenances, concerns: :paginatable
  resources :mileages, only: %i[show index], concerns: :paginatable
  resources :reminders, only: %i[show index], concerns: :paginatable
  resources :cars, except: %i[show index]

  devise_for :users

  namespace :admin do
    root 'regular_users#index'

    resources :regular_users
    resources :admin_users
    resources :cars
    resources :reminders
    resources :maintenances
    resources :workshops
    resources :mileages
  end

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
