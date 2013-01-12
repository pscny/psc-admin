# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :admin do
    email    { generate(:email) }
    password 'sekret'
  end
end
