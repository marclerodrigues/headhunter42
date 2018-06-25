FactoryBot.define do
  factory :step do
    name { FFaker::Skill.specialty }
    description { FFaker::Lorem.paragraph }
    order 1
    pipeline
  end
end
