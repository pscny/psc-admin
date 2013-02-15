FactoryGirl.define do
  factory :concert do
    name { "#{Faker::Name.name} Concert" }
    date { %w{12 14 87 45}.rand.days.send([:from_now, :ago].rand) }
  end
end
