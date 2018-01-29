# frozen_string_literal: true

class Reminder < ApplicationRecord
  include MostRecentable
  extend FriendlyId

  friendly_id :name, use: :slugged

  acts_as_paranoid

  belongs_to :car

  validates :name, presence: true
end
