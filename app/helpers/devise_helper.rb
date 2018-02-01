# frozen_string_literal: true

module DeviseHelper
  def devise_error_messages!
    return '' unless devise_error_messages?

    content_tag :div, class: 'alert-warning alert-dismissible fade show' do
      content_tag :ul do
        resource.errors.full_messages.each { |error| concat(content_tag(:li, error)) }
      end
    end
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

  def show_forgot_your_password
    devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
  end

  def show_unlock
    devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks'
  end
end
