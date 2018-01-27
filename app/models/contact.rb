# frozen_string_literal: true

class Contact
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :name, :email, :body
  validates :name, :email, :body, presence: true

  def attributes
    { name: nil, email: nil, body: nil }
  end
end
