# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car, type: :model do
  it { belong_to(:user) }
end
