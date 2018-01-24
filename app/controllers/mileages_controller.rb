# frozen_string_literal: true

class MileagesController < ApplicationController
  before_action :find_mileage, only: %i[show edit update destroy]

  def index
    @mileages = current_user.mileages.page params[:page]
  end

  def new
    @mileage = Mileage.new
  end

  def create
    @mileage = Mileage.new(mileage_params)

    if @mileage.save
      redirect_to mileages_path, notice: t('message_of_addition')
    else
      render :new
    end
  end

  def update
    if @mileage.update(mileage_params)
      redirect_to mileages_path, notice: t('message_of_modification')
    else
      render :edit
    end
  end

  def destroy
    message = @mileage.destroy ? 'message_of_deletion' : 'message_of_deletion_fail'
    redirect_to mileages_path, notice: I18n.t(message)
  end

  private

  def mileage_params
    params.require(:mileage).permit(:meter_status, :car_id, :date)
  end

  def find_mileage
    @mileage = current_user.mileages.find(params[:id])
  end
end
