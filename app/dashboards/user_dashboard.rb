# frozen_string_literal: true

require 'administrate/base_dashboard'

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    cars: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    password: Field::String.with_options(searchable: false),
    language: Field::SelectBasic.with_options(choices: User.languages.keys),
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    name: Field::String,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    avatar: Field::Carrierwave.with_options(
      image: :thumb,
      multiple: false,
      image_on_index: true
    )
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    avatar
    name
    email
    language
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    avatar
    name
    email
    language
    cars
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    sign_in_count
    current_sign_in_at
    last_sign_in_at
    current_sign_in_ip
    last_sign_in_ip
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    avatar
    name
    email
    password
    language
    cars
  ].freeze

  def display_resource(user)
    user.name
  end
end
