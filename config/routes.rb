# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :regular_users, :admin_users

    root to: 'regular_users#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
end
