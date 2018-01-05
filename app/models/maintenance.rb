# frozen_string_literal: true

class Maintenance < ApplicationRecord
  include MostRecentable

  acts_as_paranoid

  belongs_to :car
  validates :name, presence: true
end
