require 'rails_helper'

RSpec.describe Admin::CompaniesController, type: :controller do
  describe 'PUT#update' do
    let(:company) { create(:company) }
    let(:company_attributes) { attributes_for(:company) }
    let(:user) { create(:user, role: :admin) }
    before {sign_in user}

    context 'when successful' do
      before do
        put :update, params: { id: company.id, company: company_attributes }
      end

      it 'renders the correct template' do
        expect(response).to be_redirect
      end

      it 'will set flash[:notice]' do
        expect(flash[:notice]).to be_present
      end
    end

    context 'when not successful' do
      before do
        put :update, params: { id: "", company: "" }
      end

      it 'does not update the company' do
        expect(response).not_to change(comopany, :id)
      end

      it 'render the edit template' do
        expect(response).to render_template(:edit)
      end

      it 'will set flash[:error]' do
        expect(flash[:error]).to be_present
      end
    end
  end

  describe 'GET#edit' do
    before do
      let(:company) { create(:company) }
      get :edit, { id: company.id }
    end

    it 'works correctly' do
      expect(response).to be_successful
    end

    it 'assigns create' do
      expect(assigns(:create)).to eq(company)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end
end
