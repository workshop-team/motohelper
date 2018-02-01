# frozen_string_literal: true

module MotohelperDeviseHelper
  def show_forgot_your_password
    devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
  end

  def show_unlock
    devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks'
  end
end
