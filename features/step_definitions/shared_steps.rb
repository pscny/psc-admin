Given /^I am logged in$/ do
  admin = FactoryGirl.create(:admin)
  visit('/')
  click_link('Login')
  fill_in('Email',    :with => admin.email)
  fill_in('Password', :with => admin.password)
  click_button('Sign In')
end
