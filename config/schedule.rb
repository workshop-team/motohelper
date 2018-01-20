# frozen_string_literal: true

every 1.day, at: ['6:00 pm'] do
  runner 'ReminderMailer.reminder_email(Reminder.last).deliver_later'
end

every 1.day, at: ['3:00 am'] do
  runner 'ReminderService.new.perform'
end
