# frozen_string_literal: true

class Reminder < ApplicationRecord
  belongs_to :car

  validates :name, presence: true
end
