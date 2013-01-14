Given /^I am logged in( as:)?$/ do |_, table|
  options = table.present? ? table.hashes.first : {}
  admin = FactoryGirl.create(:admin, options)
  visit('/')
  click_link('Login')
  fill_in('Email',    :with => admin.email)
  fill_in('Password', :with => admin.password)
  click_button('Sign In')
end
