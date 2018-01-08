# frozen_string_literal: true

FactoryBot.define do
  init_mileage = 80_000
  init_date = 6.months.ago

  sequence(:reminder_mileage) { init_mileage += rand(200..400) }
  sequence(:reminder_date) { init_date += rand(30..90).days }

  factory :reminder do
    name { DataSets.reminder }
    mileage { generate :reminder_mileage }
    reminder_date { generate :reminder_date }
    note { Faker::ChuckNorris.fact }
    car
  end
end
