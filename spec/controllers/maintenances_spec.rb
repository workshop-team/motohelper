# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MaintenancesController, type: :controller do
  describe 'GET #show' do
    let(:maintenance) { create(:maintenance) }

    before { sign_in maintenance.car.user }

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'renders the show template' do
      get :show, params: { id: maintenance }
      expect(response).to render_template('show')
    end
  end
end
