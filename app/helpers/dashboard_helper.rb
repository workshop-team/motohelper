# frozen_string_literal: true

module DashboardHelper
  def convert_partial_name_to_class(partial_name)
    partial_name == 'closest_service_init' ? 'closest_service' : partial_name
  end

  def google_place_url(service)
    google_url = 'https://www.google.com/maps/search/?api=1'
    valid_url = CGI.escape(service[:name])

    "#{google_url}&query=#{valid_url}&query_place_id=#{service[:place_id]}"
  end
end
