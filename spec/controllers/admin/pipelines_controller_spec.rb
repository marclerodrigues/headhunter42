require 'rails_helper'

RSpec.describe Admin::PipelinesController, type: :controller do
  let(:user) { create(:user, role: :admin) }
  before { sign_in(user) }

  describe "GET#index" do
    before do
      get :index
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end
  end

  describe "GET#show" do
    let(:pipeline) { create(:pipeline) }
    before do
      get :show, params: { id: pipeline.id }
    end

    it "renders the index template" do
      expect(response).to render_template(:show)
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end
  end

  describe "GET#new" do
    before do
      get :new
    end

    it "renders the index template" do
      expect(response).to render_template(:new)
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) { { name: FFaker::JobBR.title } }

      it "creates a new pipeline" do
        expect {
          post :create, params: { pipeline: valid_attributes }
        }.to change(Pipeline, :count).by(1)
      end

      it "redirects to correct path" do
        post :create, params: { pipeline: valid_attributes }
        expect(response).to be_redirect
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { { name: "" } }

      it "does not create a new user" do
        expect {
          post :create, params: { pipeline: invalid_attributes }
        }.not_to change(Pipeline, :count)
      end

      it "renders the new template" do
        post :create, params: { pipeline: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET#edit" do
    let(:pipeline) { create(:pipeline) }

    before do
      get :edit, params: { id: pipeline.id }
    end

    it "works correctly" do
      expect(response).to be_successful
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT#update" do
    let(:pipeline) { create(:pipeline) }

    context "when successful" do
      let(:pipeline_attributes) { attributes_for(:pipeline) }

      before do
        put :update, params: { id: pipeline.id, pipeline: pipeline_attributes }
      end

      it "redirects to admin dashboard" do
        expect(response).to be_redirect
      end
    end

    context "when not successful" do
      let(:pipeline_attributes) { attributes_for(:pipeline, name: "") }

      it "does not update the pipeline" do
        expect {
           put :update, params: { id: pipeline.id, pipeline: pipeline_attributes }
        }.not_to change { pipeline.reload }
      end

      it "renders the edit template" do
        put :update, params: { id: pipeline.id, pipeline: pipeline_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE#destroy" do
    let!(:pipeline) { create(:pipeline) }

    it "deletes a pipeline" do
      expect {
        delete :destroy, params: { id: pipeline.id }
      }.to change {
        Pipeline.count
      }.by(-1)
    end

    it "redirects to correct path" do
      delete :destroy, params: { id: pipeline.id }

      expect(response).to be_redirect
    end
  end
end
