# frozen_string_literal: true

class ReminderService
  def initialize
    @reminder_days = 7
  end

  def perform
    Reminder
      .where(reminder_date: @reminder_days.day.since, sended: nil)
      .each { |reminder| send_email(reminder) }
  end

  def send_email(reminder)
    reminder.name

    ActiveRecord::Base.transaction do
      reminder.update(sended: Date.today)
      ReminderMailer.reminder_email(reminder).deliver_now
    end
  end
end
