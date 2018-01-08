# frozen_string_literal: true

FactoryBot.define do
  brand_model = DataSets.brand_model

  factory :car do
    brand { brand_model[:brand] }
    model { brand_model[:model] }
    registration_number { DataSets.registration_number }
    user
  end
end
