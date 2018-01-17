# frozen_string_literal: true

module DashboardHelper
  def convert_partial_name_to_class(partial_name)
    partial_name == 'closest_service_init' ? 'closest_service' : partial_name
  end
end
