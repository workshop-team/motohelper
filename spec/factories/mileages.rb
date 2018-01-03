# frozen_string_literal:true

FactoryBot.define do
  factory :mileage do
    meter_status 187_676
    date { Date.today }
    car
  end
end
