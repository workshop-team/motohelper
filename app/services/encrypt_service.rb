# frozen_string_literal: true

class EncryptService
  key = ActiveSupport::KeyGenerator.new('password').generate_key([ENV['MESSAGE_ENCRYPTOR_SALT']].pack('H*'), 32)
  @encryptor = ActiveSupport::MessageEncryptor.new(key)

  def self.encrypt_data(value)
    @encryptor.encrypt_and_sign(value) if value.present?
  end

  def self.decrypt_data(value)
    @encryptor.decrypt_and_verify(value) if value.present?
  end
end
