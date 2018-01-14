# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before { create(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should have_many(:cars) }
end
