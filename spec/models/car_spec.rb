# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:registration_number) }

  it { should belong_to(:user) }
  it { should have_many(:maintenances) }
  it { should have_many(:reminders) }
  it { should have_many(:mileages) }
end
