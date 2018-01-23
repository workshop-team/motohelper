# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :find_car, only: %i[edit update destroy]

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      redirect_to dashboard_path, notice: I18n.t('message_of_addition')
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to dashboard_path, notice: I18n.t('message_of_modification')
    else
      render :edit
    end
  end

  def destroy
    message = @car.destroy ? 'message_of_deletion' : 'message_of_deletion_fail'
    redirect_to dashboard_path, notice: I18n.t(message)
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :registration_number)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
