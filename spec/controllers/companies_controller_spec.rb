require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'PUT#update' do
    let(:company) { create(:company) }
    let(:company_attributes) { attributes_for(:company) }

    context 'when successful' do
      before { put :update, :id => company.id, :company => company_attributes }
      it 'renders the correct template' do
        expect(response).to redirect_to :index
      end

      it 'updates the company correctly' do
        expect(response).to be_successful
      end

      it 'will set flash[:notice]' do
        expect(flash[:notice]).to be_present
      end

    end

    context 'when not successful'
      before { put :update, :id => "", :company => "" }
      it 'does not update the company' do
        expect(response).to_not be_successful
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
      get :edit, { :id => company.id}
    end

    it 'works correctly' do
      expect(response).to be_successful
    end

    it 'assigns create' do
      expect(assigns(:create)).to eq(company)
    end

    it 'renders the edit template' do
      expect(response).to render_template("edit")
    end
  end
end
