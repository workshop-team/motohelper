# frozen_string_literal: true

class ReminderMailer < ApplicationMailer
  def reminder_email(reminder, type)
    @user = reminder.car.user
    @reminder = reminder
    @type = type
    mail(to: @user.email, subject: 'Motohelper - powiadomienie')
  end
end
