# frozen_string_literal: true

require 'administrate/base_dashboard'

class ReminderDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    car: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    reminder_date: Field::DateTime,
    mileage: Field::Number,
    note: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    name
    reminder_date
    mileage
    car
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    name
    reminder_date
    mileage
    car
    note
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    reminder_date
    mileage
    note
  ].freeze

  def display_resource(reminder)
    reminder.name
  end
end
