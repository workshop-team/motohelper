# frozen_string_literal: true

class Maintenance < ApplicationRecord
  belongs_to :car
  validates :name, presence: true
end
