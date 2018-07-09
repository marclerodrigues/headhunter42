require 'rails_helper'

RSpec.describe Pipeline, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "relations" do
    it { is_expected.to have_many(:steps) }
    it { is_expected.to have_many(:vacancies) }
  end
end
