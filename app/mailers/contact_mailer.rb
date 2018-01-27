# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def mail_info(contact)
    @contact = contact

    mail(to: 'motohelper.pl@gmail.com', subject: 'Message from contact form')
  end
end
