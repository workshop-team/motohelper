# frozen_string_literal: true

class FindNearby
  def initialize(current_user)
    @latitude = current_user.latitude
    @longitude = current_user.longitude
    @language = current_user.language
    @use_id = current_user.id
  end

  AVAILABLE_TYPES = %w[car_dealer car_rental car_wash car_repair gas_station parking].freeze
  def find_places
    {}.tap do |places|
      AVAILABLE_TYPES.each do |type|
        places[type] = reduced_place(type)
      end
    end
  end

  def last_position_address
    GoogleApi.get_address(@latitude, @longitude, @language)['results'].first['formatted_address']
  end

  def places_session
    return unless @latitude.present? && @longitude.present?

    if can_be_cached?(cache_key)
      Rails.cache.write cache_key, {
        places: find_places, address: last_position_address
      }, expires_in: 7.days
    end
    Rails.cache.read(cache_key)
  end

  private

  def cache_key
    "#{@user_id}:#{@latitude}:#{@longitude}"
  end

  def can_be_cached?(cache_key)
    Rails.cache.read(cache_key).nil?
  end

  def reduced_place(type)
    api_places = GoogleApi.find_objects_nearby(@latitude, @longitude, type)['results']
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
