# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @data = {}
    @data[:cars] = 'Volvo S80 KBR 007'
    @data[:closest_service] = '28-12-17 12:15'
    @data[:maintenance] = 'Wymiana opon'
    @data[:mileage] = '153324km'
    @data[:reminders] = 'Zamówic wizytę w warsztacie'
  end
end
