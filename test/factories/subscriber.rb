FactoryGirl.define do
  sequence :surname    do |n| end
  sequence :first_name do |n| end
end

FactoryGirl.define do
  factory :subscriber do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { Faker::Internet.email }
    source     { Subscriber::SOURCES.sample }
    state      { PscVariables::STATES.values.map{|h|h['abbreviation']}.sample }
  end
end
