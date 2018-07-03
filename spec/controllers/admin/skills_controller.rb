require 'rails_helper'

RSpec.describe Admin::SkillsController, type: :controller do
  let(:user) { create(:user, role: :admin) }
  before { sign_in(user) }

  describe "GET#edit" do
    let(:skill) { create(:skill) }

    before do
      get :edit, params: { id: skill.id }
    end

    it "works correctly" do
      expect(response).to be_successful
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT#update" do
    let(:skill) { create(:skill) }

    context "when successful" do
      let(:skill_attributes) { attributes_for(:skill) }

      before do
        put :update, params: { id: skill.id, skill: skill_attributes }
      end

      it "redirects to pipelines path" do
        expect(response).to be_redirect
      end
    end

    context "when not successful" do
      let(:skill_attributes) { attributes_for(:skill, name: "") }

      it "does not updates the step" do
        expect {
          put :update, params: { id: skill.id, skill: skill_attributes }
        }.not_to change { skill.reload }
      end

      it "renders the edit template" do
        put :update, params: { id: skill.id, skill: skill_attributes }

        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE#destroy" do
    let!(:skill) { create(:skill) }

    it "deletes a step" do
      expect {
        delete :destroy, params: { id: skill.id }
      }.to change(Skill, :count).by(-1)
    end

    it "redirects to pipelines path" do
      delete :destroy, params: { id: skill.id }

      expect(response).to be_redirect
    end
  end
end
