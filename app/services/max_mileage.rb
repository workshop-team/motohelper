# frozen_string_literal: true

class MaxMileage
  def self.value(car_id)
    return 0 unless car_id

    car = Car.find(car_id)

    [].tap do |mileage|
      mileage << car.mileages.maximum(:meter_status)
      mileage << car.maintenances.maximum(:mileage)
    end.compact.max || 0
  end

  def self.value_ok?(car_id, entered_value)
    value(car_id) <= entered_value
  end
end
