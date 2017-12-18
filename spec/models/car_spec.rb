# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:maintenances) }
end
