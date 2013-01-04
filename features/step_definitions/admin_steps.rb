Given /^the admin (.+) with password (.+) exists$/ do |email, password|
  admin          = FactoryGirl.build(:admin)
  admin.email    = email
  admin.password = password
  admin.save!
end
