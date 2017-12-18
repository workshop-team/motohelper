# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance do
    name 'MyString'
    mileage 1
    warranty_date '2017-12-17'
    note 'MyText'
    car nil
  end
end
