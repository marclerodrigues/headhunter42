require 'rails_helper'

RSpec.describe Admin::VacanciesController, type: :controller do
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
    let(:vacancy) { create(:vacancy) }

    before do
      get :show, params: { id: vacancy.id }
    end

    it "renders the show template" do
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

  describe "POST#create" do
    context "with valid attributes" do
      let(:pipeline) { create(:pipeline) }
      let(:valid_attributes) do
        {
          name: FFaker::JobBR.title,
          description: FFaker::Lorem.paragraph,
          perks: FFaker::Lorem.paragraph,
          min_salary: 1000,
          max_salary: 10000,
          start_date: FFaker::Time.date,
          end_date: FFaker::Time.date,
          active: true,
          pipeline_id: pipeline.id
        }
      end

      it "creates a new vacancy" do
        expect {
          post :create, params: { vacancy: valid_attributes }
        }.to change(Vacancy, :count).by(1)
      end

      it "returns a redirect response" do
        post :create, params: { vacancy: valid_attributes }
        expect(response).to be_redirect
      end

      it "redirects correctly" do
        post :create, params: { vacancy: valid_attributes }
        expect(response).to redirect_to(admin_vacancy_path(Vacancy.last))
      end
    end

    context "with invalid attributes" do
      let(:pipeline) { create(:pipeline) }
      let(:invalid_attributes) do
        {
          description: FFaker::Lorem.paragraph,
          perks: FFaker::Lorem.paragraph,
          min_salary: 1000,
          max_salary: 10000,
          start_date: FFaker::Time.date,
          end_date: FFaker::Time.date,
          active: true,
          pipeline_id: pipeline.id
        }
      end

      it "does not create a new vacancy" do
        expect {
          post :create, params: { vacancy: invalid_attributes }
        }.not_to change(Vacancy, :count)
      end

      it "renders the new template" do
        post :create, params: { vacancy: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET#edit" do
    let(:vacancy) { create(:vacancy) }

    before do
      get :edit, params: { id: vacancy.id }
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT#update" do
    let(:vacancy) { create(:vacancy) }

    context "when successful" do
      let(:vacancy_attributes) { attributes_for(:vacancy) }

      before do
        put :update, params: { id: vacancy.id, vacancy: vacancy_attributes }
      end

      it "returns a redirect response" do
        expect(response).to be_redirect
      end

      it "redirects correctly" do
        expect(response).to redirect_to(admin_vacancy_path(vacancy))
      end
    end

    context "when not successful" do
      let(:vacancy_attributes) { attributes_for(:vacancy, name: "") }

      it "does not update the vacancy" do
        expect {
           put :update, params: { id: vacancy.id, vacancy: vacancy_attributes }
        }.not_to change { vacancy.reload }
      end

      it "renders the edit template" do
        put :update, params: { id: vacancy.id, vacancy: vacancy_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE#destroy" do
    let!(:vacancy) { create(:vacancy) }

    it "deletes a vacancy" do
      expect {
        delete :destroy, params: { id: vacancy.id }
      }.to change {
        Vacancy.count
      }.by(-1)
    end

    it "returns a redirect response" do
      delete :destroy, params: { id: vacancy.id }
      expect(response).to be_redirect
    end

    it "redirects correctly" do
      delete :destroy, params: { id: vacancy.id }
      expect(response).to redirect_to(admin_vacancies_path)
    end
  end
end
