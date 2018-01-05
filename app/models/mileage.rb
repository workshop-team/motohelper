# frozen_string_literal: true

class Mileage < ApplicationRecord
  include MostRecentable

  acts_as_paranoid

  belongs_to :car

  validates :meter_status, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :date, presence: true
end
