require 'rails_helper'

RSpec.describe User, type: :model do
  context 'relations' do
    it { is_expected.to have_many(:applications).dependent(:destroy) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to enumerize(:role).in(:admin, :reviewer, :candidate).with_default(:candidate) }

    describe "password validation" do
      context "when skip_password_validation is true" do
        before { subject.skip_password_validation = true }

        it { is_expected.to_not validate_presence_of(:password)}
      end

      context "when skip_password_validation is false" do
        before { subject.skip_password_validation = false }

        it { is_expected.to validate_presence_of(:password)}
      end
    end
  end

  describe ".admins" do
    let!(:admin) { create(:user, role: :admin) }
    let!(:reviewer) { create(:user, role: :reviewer) }
    let!(:candidate) { create(:user, role: :candidate) }

    subject { described_class.admins }

    it "returns only admin users" do
      expect(subject).to contain_exactly(admin)
    end
  end

  describe ".reviewers" do
    let!(:admin) { create(:user, role: :admin) }
    let!(:reviewer) { create(:user, role: :reviewer) }
    let!(:candidate) { create(:user, role: :candidate) }

    subject { described_class.reviewers }

    it "returns only reviewer users" do
      expect(subject).to contain_exactly(reviewer)
    end
  end

  describe ".candidates" do
    let!(:admin) { create(:user, role: :admin) }
    let!(:reviewer) { create(:user, role: :reviewer) }
    let!(:candidate) {  create(:user, role: :candidate) }

    subject { described_class.candidates }

    it "returns only candidate users" do
      expect(subject).to contain_exactly(candidate)
    end
  end

  describe ".admins_and_reviewers" do
    let!(:admin) { create(:user, role: :admin) }
    let!(:reviewer) { create(:user, role: :reviewer) }
    let!(:candidate) {  create(:user, role: :candidate) }

    subject { described_class.admins_and_reviewers }

    it "returns only candidate users" do
      expect(subject).to contain_exactly(admin, reviewer)
    end
  end
end
