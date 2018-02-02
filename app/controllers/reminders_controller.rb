# frozen_string_literal: true

class RemindersController < ApplicationController
  before_action :find_reminder, only: %i[show edit update destroy archive restore_archived]

  def index
    @reminders = current_user.reminders.not_archived.order_table.page params[:page]
    @archive = false
  end

  def archived
    @reminders = current_user.reminders.archived.order_table.page params[:page]
    @archive = true
    render :index
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)

    if @reminder.save
      redirect_to reminders_path, notice: t('message_of_addition')
    else
      render :new
    end
  end

  def update
    if @reminder.update(reminder_params)
      redirect_to reminders_path, notice: t('message_of_modification')
    else
      render :edit
    end
  end

  def destroy
    @reminder.destroy
    redirect_to reminders_path, notice: t('message_of_deletion')
  end

  def archive
    if @reminder.update(archived: Date.today)
      redirect_to reminders_path, notice: t('.message_about_archiving')
    else
      flash[:danger] = t('.message_about_archiving_fail')
    end
  end

  def restore_archived
    if @reminder.update(archived: nil)
      redirect_to reminders_path, notice: t('.message_about_restoring')
    else
      flash[:danger] = t('.message_about_restoring_fail')
    end
  end

  private

  def reminder_params
    params.require(:reminder).permit(%i[name reminder_date mileage note car_id sended archived])
  end

  def find_reminder
    @reminder = current_user.reminders.friendly.find(params[:id])
  end
end
