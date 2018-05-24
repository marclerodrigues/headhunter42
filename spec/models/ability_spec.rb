require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  context 'admin' do
    let(:admin) { build(:user, role: :admin) }
    let(:ability) { described_class.new(admin) }

    it 'can manage all' do
      expect(ability).to be_able_to(:manage, :all)
    end

    it 'can manage the object Company' do
      expect(ability).to be_able_to(:manage, Company)
    end
  end

  context 'reviewer' do
    let(:reviewer) { build(:user, role: :reviewer) }
    let(:ability) { described_class.new(reviewer) }

    it 'can read all' do
      expect(ability).to be_able_to(:read, :all)
    end

    it 'cannot manage the object Company' do
      expect(ability).to_not be_able_to(:manage, Company)
    end
  end

  context 'candidate' do
    let(:candidate) { build(:user, role: :candidate) }
    let(:ability) { described_class.new(candidate) }

    it 'cannot manage all' do
      expect(ability).to_not be_able_to(:manage, :all)
    end

    it 'cannot read all' do
      expect(ability).to_not be_able_to(:read, :all)
    end

    it 'cannot manage the object Company' do
      expect(ability).to_not be_able_to(:manage, Company)
    end
  end
end
