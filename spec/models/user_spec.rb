# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car, type: :model do
  it { validate_presence_of(:name) }
  it { have_many(:cars) }
end
