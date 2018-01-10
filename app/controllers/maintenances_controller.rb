# frozen_string_literal: true

class MaintenancesController < ApplicationController
  before_action :find_maintenance, only: %i[show edit update]

  def index
    @maintenances = current_user.maintenances.page params[:page]
  end

  def new
    @maintenance = Maintenance.new
  end

  def create
    @maintenance = Maintenance.new(maintenance_params)

    if @maintenance.save
      redirect_to maintenances_path, notice: I18n.t('message_of_addition')
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

  private

  def maintenance_params
    params.require(:maintenance).permit(%i[name mileage warranty_date note car_id])
  end

  def find_maintenance
    @maintenance = current_user.maintenances.find(params[:id])
  end
end
