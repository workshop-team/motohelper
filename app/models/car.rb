# frozen_string_literal: true

class Car < ApplicationRecord
  extend FriendlyId

  friendly_id :car_name, use: :slugged

  acts_as_paranoid

  belongs_to :user
  has_many :maintenances, dependent: :destroy
  has_many :reminders, dependent: :destroy
  has_many :mileages, dependent: :destroy

  validates :brand, :model, :registration_number, presence: true

  def car_name
    decorate.name
  end
end
