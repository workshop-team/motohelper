# frozen_string_literal: true

require 'administrate/base_dashboard'
class MaintenanceDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    car: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    mileage: Field::Number,
    warranty_date: Field::DateTime,
    note: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    name
    mileage
    warranty_date
    car
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    name
    mileage
    warranty_date
    car
    note
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    mileage
    warranty_date
    note
  ].freeze
  def display_resourece(maintenance)
    maintenance.name
  end
end
