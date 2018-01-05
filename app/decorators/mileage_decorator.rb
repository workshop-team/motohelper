# frozen_string_literal: true

class MileageDecorator < Draper::Decorator
  delegate_all

  def meter_status
    h.number_with_delimiter(object.meter_status)
  end
end
