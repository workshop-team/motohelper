# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance do
    name 'Change motor'
    mileage 145_000
    warranty_date 12.months.since
    note 'Note'
    car
  end
end
