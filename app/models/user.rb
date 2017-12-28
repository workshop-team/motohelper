# frozen_string_literal: true

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cars, dependent: :destroy

  validates :name, presence: true

  def admin?
    type == 'AdminUser'
  end
end
