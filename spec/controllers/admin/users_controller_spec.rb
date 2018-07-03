require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
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

  describe "POST#create" do
    context "with valid attributes" do
      let(:valid_attributes) do
        {
          first_name: FFaker::NameBR.first_name,
          last_name: FFaker::NameBR.last_name,
          email: FFaker::Internet.email
        }
      end

      it "creates a new user" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "returns a redirect response" do
        post :create, params: { user: valid_attributes }
        expect(response).to be_redirect
      end

      it "redirects correctly" do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(admin_dashboards_path)
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) do
        {
          first_name: FFaker::NameBR.first_name,
          last_name: FFaker::NameBR.last_name
        }
      end

      it "does not create a new user" do
        expect {
          post :create, params: { user: invalid_attributes }
        }.not_to change(User, :count)
      end

      it "renders the new template" do
        post :create, params: { user: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE#destroy" do
    let!(:user_2) { create(:user, role: :reviewer) }

    it "deletes an user" do
      expect {
        delete :destroy, params: { id: user_2.id }
      }.to change {
        User.count
      }.by(-1)
    end

    it "returns a redirect response" do
      delete :destroy, params: { id: user_2.id }
      expect(response).to be_redirect
    end

    it "redirects correctly" do
      delete :destroy, params: { id: user_2.id }
      expect(response).to redirect_to(admin_users_path)
    end
  end
end
