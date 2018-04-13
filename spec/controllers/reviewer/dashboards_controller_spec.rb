require 'rails_helper'

RSpec.describe Reviewer::DashboardsController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user, role: :reviewer) }
    before { sign_in user }

    before do
      get :index
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end
  end
end
