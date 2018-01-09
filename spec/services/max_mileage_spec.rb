# frozen_string_literal: true

require 'rails_helper'

describe 'Max Mileage' do
  let(:car_id_1) { create(:car).id }
  let(:car_id_2) { create(:car).id }

  before do
    create(:maintenance, car_id: car_id_1, mileage: 80_000)
    create(:maintenance, car_id: car_id_1, mileage: 70_000)
    create(:maintenance, car_id: car_id_1, mileage: 85_000)

    create(:mileage, car_id: car_id_1, meter_status: 83_000)
  end

  it 'returns 85 000' do
    expect(MaxMileage.value(car_id_1)).to eq 85_000
  end

  it 'returns 95 000' do
    create(:mileage, car_id: car_id_1, meter_status: 95_000)
    expect(MaxMileage.value(car_id_1)).to eq 95_000
  end

  it 'returns 0' do
    expect(MaxMileage.value(car_id_2)).to eq 0
  end

  it 'returns 0' do
    expect(MaxMileage.value(nil)).to eq 0
  end
end
