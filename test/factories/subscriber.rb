FactoryGirl.define do
  sequence :surname    do |n| end
  sequence :first_name do |n| end
end

FactoryGirl.define do
  factory :subscriber do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
  end
end
