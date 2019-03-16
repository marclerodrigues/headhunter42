require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:perks) }
  end

  context "relations" do
    it { is_expected.to belong_to(:pipeline) }
    it { is_expected.to have_many(:applications).dependent(:destroy) }
  end
end
