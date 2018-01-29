# frozen_string_literal: true

class RemindersController < ApplicationController
  before_action :find_reminder, only: %i[show edit update destroy]

  def index
    @reminders = current_user.reminders.order('sended DESC NULLS LAST', reminder_date: :desc).page params[:page]
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)

    if @reminder.save
      redirect_to reminders_path, notice: I18n.t('message_of_addition')
    else
      render :new
    end
  end

  def update
    if @reminder.update(reminder_params)
      redirect_to reminders_path, notice: I18n.t('message_of_modification')
    else
      render :edit
    end
  end

  def destroy
    @reminder.destroy
    redirect_to reminders_path, notice: I18n.t('message_of_deletion')
  end

  private

  def reminder_params
    params.require(:reminder).permit(%i[name reminder_date mileage note car_id sended archived])
  end

  def find_reminder
    @reminder = current_user.reminders.friendly.find(params[:id])
  end
end
