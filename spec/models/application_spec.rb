require 'rails_helper'

RSpec.describe Application, type: :model do
  context "relations" do
    it { is_expected.to belong_to(:vacancy) }
    it { is_expected.to belong_to(:user) }
  end
end
