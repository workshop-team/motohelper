# frozen_string_literal: true

FactoryBot.define do
  init_mileage = 80_000
  init_date = 6.months.ago

  sequence(:mileage) { init_mileage += rand(200..400) }
  sequence(:warranty_date) { init_date += rand(30..90).days }

  factory :maintenance do
    name { DataSets.maintenance }
    mileage { generate :mileage }
    warranty_date { generate :warranty_date }
    note { Faker::ChuckNorris.fact }
    car
  end
end
