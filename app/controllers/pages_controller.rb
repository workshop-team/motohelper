# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def dashboard
    @data = {
      cars: current_user.cars.decorate,
      maintenances: current_user.maintenances.most_recent(5),
      mileages: current_user.mileages.most_recent(5).decorate,
      reminders: current_user.reminders.most_recent(5),
      closest_service: places_session
    }
  end

  private

  def places_session
    Rails.cache.write cache_key, { places: find_nearby, address: last_address }, expires_in: 7.days if can_be_cached?
    Rails.cache.read(cache_key)
  end

  def find_nearby
    FindNearby.new.find_places(current_user.latitude, current_user.longitude)
  end

  def last_address
    FindNearby.new.last_position_address(current_user.latitude, current_user.longitude, current_user.language)
  end

  def cache_key
    "#{current_user.id}:#{current_user.latitude}:#{current_user.longitude}"
  end

  def can_be_cached?
    Rails.cache.read(cache_key).nil? && current_user.longitude.present? && current_user.longitude.present?
  end
end
