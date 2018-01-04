# frozen_string_literal: true

class Maintenance < ApplicationRecord
  acts_as_paranoid

  belongs_to :car
  validates :name, presence: true

  scope :most_recent, ->(limit) { limit(limit).order(created_at: :desc) }
end
