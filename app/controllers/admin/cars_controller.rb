# frozen_string_literal: true

module Admin
  class CarsController < Admin::ApplicationController
    # Define a custom finder by overriding the `find_resource` method:
    def find_resource(param)
      Car.friendly.find(param)
    end
  end
end
