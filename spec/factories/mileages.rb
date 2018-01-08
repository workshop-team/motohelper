# frozen_string_literal: true

FactoryBot.define do
  init_meter_status = 80_000
  init_date = 6.months.ago

  sequence(:meter_status) { init_meter_status += rand(1_000..3_000) }
  sequence(:date) { init_date += 1.months }

  factory :mileage do
    meter_status { generate :meter_status }
    date { generate :date }
    car
  end
end
