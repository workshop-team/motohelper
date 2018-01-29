# frozen_string_literal: true

module Admin
  class MaintenancesController < Admin::ApplicationController
    # Define a custom finder by overriding the `find_resource` method:
    def find_resource(param)
      Maintenance.friendly.find(param)
    end
  end
end
