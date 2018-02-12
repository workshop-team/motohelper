# frozen_string_literal: true

module Localization
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  def set_locale
    I18n.locale = current_user.present? ? current_user.language : default_language
  end

  private

  def default_language
    if request.env['HTTP_ACCEPT_LANGUAGE'].present?
      request.env['HTTP_ACCEPT_LANGUAGE'][0..1]
    else
      I18n.default_locale
    end
  end
end
