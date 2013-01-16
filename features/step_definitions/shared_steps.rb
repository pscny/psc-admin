def login(admin)
  visit('/')
  click_link('Login')
  fill_in('Email',    :with => admin.email)
  fill_in('Password', :with => admin.password)
  click_button('Sign in')
end

Given /^I am logged in$/ do
  login(FactoryGirl.create(:admin))
end

Given /^I am logged in as:$/ do |table|
  login(FactoryGirl.create(:admin, table.hashes.first))
end
