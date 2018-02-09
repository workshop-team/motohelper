# frozen_string_literal: true

require 'administrate/base_dashboard'

class MileageDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    car: Field::BelongsTo,
    id: Field::Number,
    meter_status: Field::Number,
    date: Field::DateTime,
    deleted_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    car
    meter_status
    date
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    car
    meter_status
    date
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    car
    meter_status
    date
  ].freeze

  def display_resource(mileage)
    "Mileage ##{mileage.meter_status}"
  end
end
