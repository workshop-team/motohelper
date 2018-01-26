# frozen_string_literal: true

class ReminderService
  def initialize
    @reminder_days = 7
    @reminder_mileage = 100
  end

  def perform
    send_by_date
    send_by_mileage
  end

  def send_by_date
    Reminder
      .where(reminder_date: @reminder_days.day.since, sended: nil)
      .each { |reminder| send_email(reminder, :date) }
  end

  def send_by_mileage
    Reminder.where(sended: nil).each do |reminder|
      max_mileage = MaxMileage.value(reminder.car.id)
      send_email(reminder, :mileage) if reminder.mileage < max_mileage + @reminder_mileage
    end
  end

  def send_email(reminder, type)
    reminder.update(sended: Date.today)
    ReminderMailer.reminder_email(reminder, type.to_s).deliver_later
  end
end
