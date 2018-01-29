# frozen_string_literal: true

class MaintenancesController < ApplicationController
  before_action :find_maintenance, only: %i[show edit update destroy]

  def index
    @maintenances = current_user.maintenances.order(created_at: :desc).page params[:page]
  end

  def new
    @maintenance = Maintenance.new
  end

  def create
    @maintenance = Maintenance.new(maintenance_params)

    if @maintenance.save
      redirect_to maintenances_path
      message = message(@maintenance)
      flash[message[:type]] = I18n.t(message[:message])
    else
      render :new
    end
  end

  def update
    if @maintenance.update(maintenance_params)
      redirect_to maintenances_path, notice: I18n.t('message_of_modification')
    else
      render :edit
    end
  end

  def destroy
    @maintenance.destroy
    redirect_to maintenances_path, notice: I18n.t('message_of_deletion')
  end

  private

  def maintenance_params
    params.require(:maintenance).permit(%i[name mileage warranty_date note car_id invoice remove_invoice])
  end

  def find_maintenance
    @maintenance = current_user.maintenances.friendly.find(params[:id])
  end

  def message(maintenance)
    if MaxMileage.value_ok?(maintenance.car_id, maintenance.mileage)
      { message: 'message_of_addition', type: 'notice' }
    else
      { message: 'message_of_addition_worse_mileage', type: 'alert' }
    end
  end
end
