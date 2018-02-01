# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RemindersController, type: :controller do
  describe 'GET #show' do
    let(:reminder) { create(:reminder) }

    before { sign_in reminder.car.user }

    it 'renders the index template' do
      get :index, params: { locale: 'en' }
      expect(response).to render_template('index')
    end

    it 'renders the show template' do
      get :show, params: { id: reminder, locale: 'en' }
      expect(response).to render_template('show')
    end
  end
end
