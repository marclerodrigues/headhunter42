require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:perks) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:pipeline) }
  end
end
