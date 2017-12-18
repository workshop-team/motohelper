# frozen_string_literal: true

class Maintinance < ApplicationRecord
  belongs_to :car
  validates :name, presence: true
end
