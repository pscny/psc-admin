FactoryGirl.define do
  factory :member do
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    email         { Faker::Internet.email }
    source        { Member::SOURCES.sample }
    address1      { Faker::Address.street_address }
    city          { Faker::Address.city }
    state         { PscVariables::STATES.values.map{ |h|h['abbreviation']}.sample }
    zip_code      { Faker::Address.zip_code }
    primary_phone { Faker::PhoneNumber.numerify('##########') }
    secondary_phone { Faker::PhoneNumber.numerify('##########') }
  end
end
