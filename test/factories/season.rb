FactoryGirl.define do
  sequence(:number) {|n| n + 2011 }

  factory :season do
    season { generate(:number) }
  end
end
