require 'httparty'
module GoogleApi
  extend self

  FIND_OBJECT_NEARBY_RADIUS = 50

  def get_workshops_with_details(latitude, longitude)
    places = []
    find_object_nearby(latitude, longitude)["results"].each do |object|
      places << get_place_details(object['place_id'])["result"]
    end
    places
  end

  def find_object_nearby(latitude, longitude)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?#{object_nearby_params(latitude, longitude)}")
    body = JSON.parse(response.body)
  end

  def get_place_details(place_id)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/details/json?#{place_details_params(place_id)}")
    body = JSON.parse(response.body)
  end

private
  def object_nearby_params(latitude, longitude)
    "location=#{latitude},#{longitude}&radius=#{FIND_OBJECT_NEARBY_RADIUS}&key=#{secrets}"
  end

  def place_details_params(place_id)
    "placeid=#{place_id}&key=#{secrets}"
  end

  def secrets
    ENV["GOOGLE_API_KEY"]
  end

end