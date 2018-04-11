require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do

    it { is_expected.to validate_presence_of(:first_name) }

    it { is_expected.to validate_presence_of(:last_name) }

    it { is_expected.to enumerize(:role).in(:admin, :reviewer, :candidate).with_default(:candidate) }
  end
end
