# frozen_string_literal: true

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cars, dependent: :destroy
  has_many :maintenances, -> { includes(:car) }, through: :cars
  has_many :reminders, -> { includes(:car) }, through: :cars
  has_many :mileages, -> { includes(:car) }, through: :cars

  enum language: { pl: 0, en: 1 }

  validates :name, presence: true
  validates :email, uniqueness: true

  def admin?
    type == 'AdminUser'
  end

  def latitude=(latitude_new)
    latitude_new = EncryptService.encrypt_data(latitude_new) if latitude_new.present?
    write_attribute(:latitude, latitude_new)
  end

  def longitude=(longitude_new)
    longitude_new = EncryptService.encrypt_data(longitude_new) if longitude_new.present?
    write_attribute(:longitude, longitude_new)
  end
end
