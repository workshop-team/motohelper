# frozen_string_literal: true

Rails.application.routes.draw do
  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end

  root 'pages#home'

  get 'home' => 'pages#home'
  get 'dashboard' => 'pages#dashboard'
  get 'contact' => 'contacts#new'
  post 'contact' => 'contacts#create'

  post 'requests/user_position'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :maintenances, concerns: :paginatable
  resources :mileages, concerns: :paginatable
  resources :cars, except: %i[show index]

  resources :reminders, concerns: :paginatable do
    member do
      get 'archive'
      get 'restore_archived'
    end

    get 'archived', on: :collection
  end

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

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
