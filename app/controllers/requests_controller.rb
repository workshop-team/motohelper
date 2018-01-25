# frozen_string_literal: true

class RequestsController < ApplicationController
  def user_position
    return render json: { content: nil } unless params[:latitude].present? && params[:longitude].present?

    save_user_location

    data = {}
    data[:closest_service] = FindNearby.new(current_user).places_session

    render json: {
      content: (
        render_to_string partial: '/pages/dashboard_blocks/closest_service', locals: { data: data, layout: false }
      )
    }
  end

  private

  def save_user_location
    current_user.update(latitude: params[:latitude], longitude: params[:longitude])
  end
end
