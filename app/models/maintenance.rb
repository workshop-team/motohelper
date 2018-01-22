# frozen_string_literal: true

class Maintenance < ApplicationRecord
  include MostRecentable

  mount_uploader :invoice, InvoiceUploader

  acts_as_paranoid

  belongs_to :car
  validates :name, presence: true
end
