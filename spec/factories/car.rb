# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    brand 'Audi'
    model 'A6'
    registration_number 'WXR 2345'
    user
  end
end
