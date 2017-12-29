# frozen_string_literal: true

class MaintenancesController < ApplicationController
  def index
    @maintenances = current_user.maintenances
  end

  def show
    @maintenance = current_user.maintenances.find(params[:id])
  end
end
