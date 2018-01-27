# frozen_string_literal: true

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.mail_info(@contact.serializable_hash).deliver_later
      redirect_to contact_path, notice: t('.success_message')
    else
      flash[:alert] = t('.error_message')
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
