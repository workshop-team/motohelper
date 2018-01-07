# frozen_string_literal: true

FactoryBot.define do
  factory :reminder do
    name 'Change motor'
    mileage 145_000
    reminder_date 12.months.since
    note 'Note'
    car
  end
end
