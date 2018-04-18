require 'rails_helper'

RSpec.describe SignInPath do
  describe'#path' do

    context 'when the user is admin' do
      let(:admin) { build(:user, role: :admin)}
      it 'returns the admin root path' do
        user = described_class.new(admin)
        expect(user.path).to eq("admin/dashboards#index")
      end
    end

    context 'when the user is reviewer' do
      let(:reviewer) { build(:user, role: :reviewer)}
      it 'returns the rewiever root path' do
        user = described_class.new(reviewer)
        expect(user.path).to eq("reviewer/dashboards#index")
      end
    end

    context 'when the user is candidate' do
      let(:candidate) { build(:user, role: :candidate)}
      it 'returns the rewiever root path' do
        user = described_class.new(candidate)
        expect(user.path).to eq("admin/dashboards#index")
      end
    end
  end
end
