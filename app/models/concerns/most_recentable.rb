# frozen_string_literal: true

module MostRecentable
  extend ActiveSupport::Concern

  included do
    scope :most_recent, ->(limit) { limit(limit).order(created_at: :desc) }
  end
end
