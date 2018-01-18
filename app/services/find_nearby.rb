# frozen_string_literal: true

class FindNearby
  AVAILABLE_TYPES = %w[car_dealer car_rental car_wash car_repair gas_station parking].freeze
  def find_places(latitude, longitude)
    {}.tap do |places|
      AVAILABLE_TYPES.each do |place|
        places[place] = GoogleApi.find_objects_nearby(latitude, longitude, place)['results']
      end
    end
  end
end
