FactoryGirl.define do
  factory :todo do
    url { Faker::Lorem.word }
    code { Faker::Lorem.characters(10) }
  end
end