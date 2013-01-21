FactoryGirl.define do
  factory :admin do
    name     { Faker::Name.name }
    email    { Faker::Internet.email }
    password 'supersekret'
  end
end
