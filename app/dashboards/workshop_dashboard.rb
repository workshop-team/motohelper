# frozen_string_literal: true

require 'administrate/base_dashboard'

class WorkshopDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    kind: Field::SelectBasic.with_options(choices: Workshop.kinds.keys),
    latitude: Field::String.with_options(searchable: false),
    longitude: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    kind
    latitude
    longitude
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    kind
    latitude
    longitude
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    kind
    latitude
    longitude
  ].freeze

  def display_resource(workshop)
    "#{workshop.kind.upcase} - ID: #{workshop.id}"
  end
end
