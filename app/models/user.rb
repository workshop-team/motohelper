# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cars

  validates :name, presence: true
  before_save :set_regular_user

  def set_regular_user
    self.type = 'RegularUser'
  end

  def admin?
    type == 'AdminUser'
  end
end
