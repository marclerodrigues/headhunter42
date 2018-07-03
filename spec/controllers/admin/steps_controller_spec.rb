require 'rails_helper'

RSpec.describe Admin::StepsController, type: :controller do
  let(:user) { create(:user, role: :admin) }
  before { sign_in(user) }

  describe "GET#edit" do
    let(:step) { create(:step) }

    before do
      get :edit, params: { id: step.id }
    end

    it "works correctly" do
      expect(response).to be_successful
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT#update" do
    let(:step) { create(:step) }

    context "when successful" do
      let(:step_attributes) { attributes_for(:step) }

      before do
        put :update, params: { id: step.id, step: step_attributes }
      end

      it "returns a redirect response" do
        expect(response).to be_redirect
      end

      it "redirects correctly" do
        expect(response).to redirect_to(admin_pipelines_path)
      end
    end

    context "when not successful" do
      let(:step_attributes) { attributes_for(:step, name: "") }

      it "does not update the step" do
        expect {
           put :update, params: { id: step.id, step: step_attributes }
        }.not_to change { step.reload }
      end

      it "renders the edit template" do
        put :update, params: { id: step.id, step: step_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE#destroy" do
    let!(:step) { create(:step) }

    it "deletes a step" do
      expect {
        delete :destroy, params: { id: step.id }
      }.to change(Step, :count).by(-1)
    end

    it "returns a redirect response" do
      delete :destroy, params: { id: step.id }
      expect(response).to be_redirect
    end

    it "redirects correctly" do
      delete :destroy, params: { id: step.id }
      expect(response).to redirect_to(admin_pipelines_path)
    end
  end
end
