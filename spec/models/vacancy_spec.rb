require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:perks) }
    it { is_expected.to validate_presence_of(:min_salary) }
    it { is_expected.to validate_presence_of(:max_salary) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
  end
end
