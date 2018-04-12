require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do

  context "admin" do
    let(:admin) { build(:user, role: :admin) }
    let(:ability) { described_class.new(admin) }

    it "manage all" do
      expect(ability).to be_able_to(:manage, :all)
    end
  end


  context "reviewer" do
    let(:admin) { build(:user, role: :admin) }
    let(:ability) { described_class.new(admin) }

    it "read all" do
      expect(ability).to be_able_to(:read, :all)
    end
  end

end
