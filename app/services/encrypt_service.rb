# frozen_string_literal: true

class EncryptService
  @encryptor = ActiveSupport::MessageEncryptor.new(ENV['ENCRYPT_KEY'])

  def self.encrypt_data(value)
    @encryptor.encrypt_and_sign(value)
  end

  def self.decrypt_data(value)
    @encryptor.decrypt_and_verify(value)
  end
end
