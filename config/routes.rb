# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :regular_users
    resources :admin_users
    resources :cars

    root 'regular_users#index'
  end

  root 'home#index'
end
