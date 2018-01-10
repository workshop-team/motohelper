# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MileagesController, type: :controller do
  describe 'GET #show' do
    let(:mileage) { create(:mileage) }

    before { sign_in mileage.car.user }

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'renders the show template' do
      get :show, params: { id: mileage }
      expect(response).to render_template('show')
    end
  end
end
