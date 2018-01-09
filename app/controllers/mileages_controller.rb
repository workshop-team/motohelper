# frozen_string_literal: true

class MileagesController < ApplicationController
  def index
    @mileages = current_user.mileages.order(:car_id, created_at: :desc).page params[:page]
  end

  def show
    @mileage = current_user.mileages.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = t 'errors.rescue.record_not_found'
    redirect_to mileages_path
  end
end
