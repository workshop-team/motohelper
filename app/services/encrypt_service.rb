# frozen_string_literal: true

class EncryptService
  @encryptor = ActiveSupport::MessageEncryptor.new([ENV['MESSAGE_ENCRYPTOR_SALT']].pack('H*'))

  def self.encrypt_data(value)
    @encryptor.encrypt_and_sign(value)
  end

  def self.decrypt_data(value)
    @encryptor.decrypt_and_verify(value)
  end
end
