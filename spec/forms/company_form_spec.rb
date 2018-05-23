require 'rails_helper'

RSpec.describe CompanyForm, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:website)}
    it { is_expected.to validate_presence_of(:phone_number)}
    it { is_expected.to validate_presence_of(:address)}
    it { is_expected.to validate_presence_of(:logo)}
  end
end
