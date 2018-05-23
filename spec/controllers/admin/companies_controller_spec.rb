require 'rails_helper'

RSpec.describe Admin::CompaniesController, type: :controller do
  describe 'PUT#update' do
    let(:company) { create(:company) }
    let(:user) { create(:user, role: :admin) }
    before {sign_in user}

    context 'when successful' do
      let(:company_attributes) { attributes_for(:company, logo: '123.png') }

      before do
        put :update, params: { id: company.id, company: company_attributes }
      end

      it 'redirects to root_path' do
        expect(response).to be_redirect
      end

      it 'will set flash[:notice]' do
        expect(flash[:notice]).to match(/successfully updated/)
      end
    end

    context 'when not successful' do
      let(:company_attributes) { attributes_for(:company) }

      it 'does not update the company' do
        expect {
           put :update, params: { id: company.id, company: company_attributes }
        }.not_to change(company, :id)
      end

      it 'render the edit template' do
        put :update, params: { id: company.id, company: company_attributes }
        expect(response).to render_template(:edit)
      end

    end
  end

  describe 'GET#edit' do
    let(:company) { create(:company) }
    let(:user) { create(:user, role: :admin) }
    before {sign_in user}

    before do
      get :edit, params: { id: company.id }
    end

    it 'works correctly' do
      expect(response).to be_successful
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end
end
