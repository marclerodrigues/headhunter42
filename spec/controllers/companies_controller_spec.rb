require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe '#update' do
    let(:company1) { create(:company) }
    let(:company2) { build(:company, name: "xerox") }

    it 'needs to update attributes from the company' do
      expect do
        put :update, params { id: company1.id }
      end.to change(CampaniesController, company1).by(company2)
    end
  end
end
