# frozen_string_literal: true

class Maintenance < ApplicationRecord
  include MostRecentable
  extend FriendlyId

  friendly_id :name, use: :slugged

  mount_uploader :invoice, InvoiceUploader

  acts_as_paranoid

  belongs_to :car
  validates :name, presence: true
end
