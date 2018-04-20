require 'rails_helper'

RSpec.describe CompanyForm, type: :form do
  context 'validates tests' do
    subject { build(:company)}

    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:website)}
    it { is_expected.to validate_presence_of(:phone)}
    it { is_expected.to validate_presence_of(:address)}
    it { is_expected.to validate_presence_of(:logo)}
  end
end
