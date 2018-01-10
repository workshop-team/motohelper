# frozen_string_literal: true

class MileagesController < ApplicationController
  def index
    @mileages = current_user.mileages.page params[:page]
  end

  def show
    @mileage = current_user.mileages.find(params[:id])
  end
end
