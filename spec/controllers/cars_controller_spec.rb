# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  let(:car) { create(:car) }
  before { sign_in car.user }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: car }
      expect(response).to have_http_status(:success)
    end
  end
end
