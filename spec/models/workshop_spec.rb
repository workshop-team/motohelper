# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Workshop, type: :model do
  it { should validate_presence_of(:kind) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end
