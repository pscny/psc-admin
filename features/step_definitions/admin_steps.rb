Given /^the admin (.+) with password (.+) exists$/ do |email, password|
  admin          = FactoryGirl.build(:admin)
  admin.email    = email
  admin.password = password
  admin.save!
end

Then /^I should be logged in as "(.*?)"$/ do |admin|
  page.should have_content admin
end

Given /^the following admins? exists?:$/ do |table|
  table.hashes.each do |admin|
    FactoryGirl.create(:admin, admin)
  end
end
