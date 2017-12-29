# frozen_string_literal: true

Rails.application.routes.draw do
  resources :maintenances, only: %i[show index]

  resources :dashboard, only: :index

  devise_for :users

  namespace :admin do
    resources :regular_users
    resources :admin_users
    resources :cars
    resources :reminders
    resources :maintenances
    resources :workshops

    root 'regular_users#index'
  end

  root 'home#index'
end
