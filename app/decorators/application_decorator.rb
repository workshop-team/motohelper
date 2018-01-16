# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  def mileage
    h.number_with_delimiter(object.mileage)
  end
end
