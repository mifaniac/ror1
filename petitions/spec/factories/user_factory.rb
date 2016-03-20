FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name  "Shore"
    email { Faker::Internet.email }
  end
end