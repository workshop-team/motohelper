# frozen_string_literal: true

class CarDecorator < Draper::Decorator
  delegate_all

  def name
    "#{object.brand} #{object.model} - #{object.registration_number}"
  end
end
