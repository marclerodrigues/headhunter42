FactoryBot.define do
  factory :pipeline do
    name { FFaker::JobBR.title }
  end
end
