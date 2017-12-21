# frozen_string_literal: true

require 'administrate/base_dashboard'

class CarDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    maintenances: Field::HasMany,
    reminders: Field::HasMany,
    id: Field::Number,
    registration_number: Field::String,
    brand: Field::String,
    model: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    user
    registration_number
    brand
    model
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    user
    maintenances
    reminders
    id
    registration_number
    brand
    model
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    maintenances
    reminders
    registration_number
    brand
    model
  ].freeze

  # Overwrite this method to customize how cars are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(car)
  #   "Car ##{car.id}"
  # end
end
