# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def dashboard
    @data = {}

    @data[:cars] = current_user.cars.decorate
    @data[:closest_service] = '28-12-17 12:15'
    @data[:maintenances] = current_user.maintenances.most_recent(5)
    @data[:mileages] = current_user.mileages.most_recent(5).decorate
    @data[:reminders] = current_user.reminders.most_recent(5)
  end

  def find_nearby
    objects_nearby = find_nearby(geolocation)
    @car_dealer = objects_nearby['car_dealer']
    @car_rental = objects_nearby['car_rental']
    @car_wash = objects_nearby['car_wash']
    @car_repair = objects_nearby['car_repair']
    @gas_station = objects_nearby['car_station']
    @parking = objects_nearby['parking']
  end

  def find_nearby
    FindNearby.new.find_places(latitude, longitude)
  end

  def geolocation
    [current_user.latitude, current_user.longitude]
  end

end
