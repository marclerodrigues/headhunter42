require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  describe 'GET#index' do
    let(:user) { create(:user, role: :admin) }
    before do
      sign_in user
      get :index
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end
  end

  describe 'GET#new' do
    let(:user) { create(:user, role: :admin) }
    before do
      sign_in user
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
    let(:user) { create(:user, role: :admin) }
    before { sign_in user }

    context "with valid attributes" do
      let(:valid_attributes) do
        {
          first_name: FFaker::NameBR.first_name,
          last_name: FFaker::NameBR.last_name,
          email: FFaker::Internet.email
        }
      end

      it 'creates a new user' do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) do
        {
          first_name: FFaker::NameBR.first_name,
          last_name: FFaker::NameBR.last_name
        }
      end

      it "does not creates a new user" do
        expect {
          post :create, params: { user: invalid_attributes }
        }.not_to change(User, :count)
      end
    end
  end

  describe "DELETE#destroy" do
    let(:user) { create(:user, role: :admin) }
    before { sign_in user }
    let!(:user_2) { create(:user, role: :reviewer) }

    it "deletes an user" do
      expect {
        delete :destroy, params: { id: user_2.id }
      }.to change {
        User.count
      }.by(-1)
    end
  end
end
