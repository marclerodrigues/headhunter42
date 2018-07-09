FactoryBot.define do
  factory :vacancy do
    name "MyString"
    description "MyText"
    perks "MyText"
    min_salary 1
    max_salary 1
    start_date "2018-07-03"
    end_date "2018-07-03"
    active true
    pipeline
  end
end
