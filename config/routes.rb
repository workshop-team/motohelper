# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home' => 'pages#home'
  get 'dashboard' => 'pages#dashboard'
  get 'find_nearby' => 'find_nearby#index'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :maintenances, only: %i[show index], concerns: :paginatable
  resources :mileages, only: %i[show index], concerns: :paginatable
  resources :reminders, only: %i[show index], concerns: :paginatable
  resources :dashboard, only: :index

  devise_for :users

  namespace :admin do
    resources :regular_users
    resources :admin_users
    resources :cars
    resources :reminders
    resources :maintenances
    resources :workshops
    resources :mileages

    root 'regular_users#index'
  end

  root 'pages#home'
end
