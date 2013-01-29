FactoryGirl.define do
  sequence :surname    do |n| end
  sequence :first_name do |n| end
end

FactoryGirl.define do
  factory :subscriber do
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    email         { Faker::Internet.email }
    source        { Subscriber::SOURCES.sample }
    address1      { Faker::Address.street_address }
    city          { Faker::Address.city }
    state         { PscVariables::STATES.values.map{ |h|h['abbreviation']}.sample }
    zip_code      { Faker::Address.zip_code }
    primary_phone { Faker::PhoneNumber.numerify('##########') }
    secondary_phone { Faker::PhoneNumber.numerify('##########') }
  end
end
