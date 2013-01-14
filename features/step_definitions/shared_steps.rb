def login(admin)
  visit('/')
  click_link('Login')
  fill_in('Email',    :with => admin.email)
  fill_in('Password', :with => admin.password)
  click_button('Sign In')
end

Given /^I am logged in$/ do
  login(FactoryGirl.create(:admin))
end

Given /^I am logged in as:$/ do |table|
  options = table.present? ? table.hashes.first : {}
  login(FactoryGirl.create(:admin, options))
end
