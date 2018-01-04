# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def dashboard
    @data = {}

    @data[:cars] = current_user.cars.decorate
    @data[:closest_service] = '28-12-17 12:15'
    @data[:maintenances] = current_user.maintenances.most_recent(5)
    @data[:mileage] = '153324km'
    @data[:reminders] = 'Zamówic wizytę w warsztacie'
  end
end
