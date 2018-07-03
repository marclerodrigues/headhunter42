require 'rails_helper'

RSpec.describe Step, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:order) }
    it { is_expected.to validate_uniqueness_of(:order).scoped_to(:pipeline_id) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:pipeline) }
    it { is_expected.to have_many(:skills) }
  end
end
