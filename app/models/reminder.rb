# frozen_string_literal: true

class Reminder < ApplicationRecord
  include MostRecentable

  acts_as_paranoid

  belongs_to :car

  validates :name, presence: true

  scope :order_table, -> { order('sended DESC NULLS LAST', reminder_date: :desc) }
  scope :archived, -> { where.not(archived: nil) }
  scope :not_archived, -> { where(archived: nil) }
end
