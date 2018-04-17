require 'rails_helper'

RSpec.describe SignInPath do
  describe'#path' do
    let(:reviewer) { build(:user, role: :reviewer)}
    let(:candidate) { build(:user, role: :candidate)}
    let(:admin) { build(:user, role: :admin)}

    context 'when the user is admin' do
      it 'returns the admin root path' do
        user = described_class.new(admin)
        expect(user.path).to eq("admin/dashboards#index")
      end
    end

    context 'when the user is reviewer' do
      it 'returns the rewiever root path' do
        user = described_class.new(reviewer)
        expect(user.path).to eq("reviewer/dashboards#index")
      end
    end
  end
end
