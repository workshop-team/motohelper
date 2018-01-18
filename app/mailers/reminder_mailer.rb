# frozen_string_literal: true

class ReminderMailer < ApplicationMailer
  def reminder_email(reminder)
    @user = reminder.car.user
    @reminder = reminder
    mail(to: @user.email, subject: 'Motohelper - powiadomienie')
  end
end
