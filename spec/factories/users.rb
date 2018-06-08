FactoryBot.define do
  factory :user do
    first_name "Michael"
    last_name "Root"
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    confirmed_at Time.current
  end
end
