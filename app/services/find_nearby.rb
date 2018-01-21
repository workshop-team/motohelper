# frozen_string_literal: true

class FindNearby
  AVAILABLE_TYPES = %w[car_dealer car_rental car_wash car_repair gas_station parking].freeze
  def find_places(latitude, longitude)
    {}.tap do |places|
      AVAILABLE_TYPES.each do |type|
        places[type] = reduced_place(latitude, longitude, type)
      end
    end
  end

  def last_position_address(latitude, longitude, language)
    GoogleApi.get_address(latitude, longitude, language)['results'].first['formatted_address']
  end

  def places_session(user_id, latitude, longitude, language)
    cache_key = "#{user_id}:#{latitude}:#{longitude}"
    if can_be_cached?(cache_key, latitude, longitude)
      Rails.cache.write cache_key, {
        places: find_places(latitude, longitude), address: last_position_address(latitude, longitude, language)
      }, expires_in: 7.days
    end
    Rails.cache.read(cache_key)
  end

  private

  def can_be_cached?(cache_key, latitude, longitude)
    Rails.cache.read(cache_key).nil? && latitude.present? && longitude.present?
  end

  def reduced_place(latitude, longitude, type)
    api_places = GoogleApi.find_objects_nearby(latitude, longitude, type)['results']
    [].tap do |parsed_places|
      api_places.each do |api_place|
        parsed_places << {
          name: api_place['name'],
          vicinity: api_place['vicinity'],
          place_id: api_place['place_id']
        }
      end
    end
  end
end
