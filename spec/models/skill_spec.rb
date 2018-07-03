require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:step) }
  end
end
