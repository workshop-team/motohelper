# frozen_string_literal: true

class RequestsController < ApplicationController
  def user_position
    return render json: { content: nil } unless params[:latitude].present? && params[:longitude].present?

    save_user_location

    data = {}
    data[:closest_service] = 'tutaj trzeba podlaczyc Service z hashem'

    render json: {
      content: (
        render_to_string partial: '/pages/dashboard_blocks/closest_service', locals: { data: data, layout: false }
      )
    }
  end

  private

  def save_user_location
    current_user.update(latitude: params[:latitude].to_f, longitude: params[:longitude].to_f)
  end
end
