# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Workshop, type: :model do
  it { should validate_presence_of(:kind, :latitude, :longitude) }
  it { should have_many(:cars) }
end
