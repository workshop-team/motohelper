# frozen_string_literal: true

module Localization
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  def set_locale
    I18n.locale = current_user.present? ? current_user.language : I18n.default_locale
  end
end
