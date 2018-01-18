# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def dashboard
    @data = {
      cars: current_user.cars.decorate,
      maintenances: current_user.maintenances.most_recent(5),
      mileages: current_user.mileages.most_recent(5).decorate,
      reminders: current_user.reminders.most_recent(5),
      closest_service: find_nearby
    }
  end

  private

  def find_nearby
    FindNearby.new.find_places(current_user.latitude, current_user.longitude)
  end
end
