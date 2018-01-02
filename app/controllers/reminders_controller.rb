# frozen_string_literal: true

class RemindersController < ApplicationController
  def index
    @reminders = current_user.reminders.page params[:page]
  end

  def show
    @reminder = current_user.reminders.find(params[:id])
  end
end
