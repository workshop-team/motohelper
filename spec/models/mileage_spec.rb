# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mileage, type: :model do
  it { should validate_presence_of(:meter_status) }
  it { should validate_numericality_of(:meter_status).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:date) }
  it { should belong_to(:car) }
end
