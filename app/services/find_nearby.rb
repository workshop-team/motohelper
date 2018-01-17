# frozen_string_literal: true

class FindNearby
  AVAILABLE_PLACES = %w[car_dealer car_rental car_wash car_repair gas_station parking].freeze
  def find_places(latitude, longitude)
    places = {}
    AVAILABLE_PLACES.each do |place|
      places[place] = GoogleApi.find_objects_nearby(latitude, longitude, place)['results']
    end
    places
  end
end
