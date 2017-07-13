FactoryGirl.define do
  factory :todo do
    url { Faker::Lorem.word }
    code { Faker::Number.number(10) }
  end
end