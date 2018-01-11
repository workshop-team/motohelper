# frozen_string_literal: true

require 'httparty'
module GoogleApi
  FIND_OBJECT_NEARBY_RADIUS = 10
  OBJECT_TYPES = 'car_repair'
  MAPS_GOOGLEAPIS_URL = 'https://maps.googleapis.com/maps/api/place'

  def get_workshops_with_details(latitude, longitude)
    places = []
    find_objects_nearby(latitude, longitude)['results'].each do |object|
      places << get_place_details(object['place_id'])['result']
    end
    places
  end

  def find_objects_nearby(latitude, longitude)
    response = HTTParty.get("#{MAPS_GOOGLEAPIS_URL}/nearbysearch/json?#{object_nearby_params(latitude, longitude)}")
    JSON.parse(response.body)
  end

  def get_place_details(place_id)
    response = HTTParty.get("#{MAPS_GOOGLEAPIS_URL}/details/json?#{place_details_params(place_id)}")
    JSON.parse(response.body)
  end

  private

  def object_nearby_params(latitude, longitude)
    "location=#{latitude},#{longitude}&radius=#{FIND_OBJECT_NEARBY_RADIUS}&type=#{OBJECT_TYPES}&key=#{secrets}"
  end

  def place_details_params(place_id)
    "placeid=#{place_id}&key=#{secrets}"
  end

  def secrets
    ENV['GOOGLE_API_KEY']
  end

  module_function :get_workshops_with_details, :find_objects_nearby, :get_place_details,
                  :object_nearby_params, :place_details_params, :secrets
end
