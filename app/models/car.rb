# frozen_string_literal: true

class Car < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :maintenances, dependent: :destroy
  has_many :reminders, dependent: :destroy
  has_many :mileages, dependent: :destroy

  validates :brand, :model, :registration_number, presence: true
end
