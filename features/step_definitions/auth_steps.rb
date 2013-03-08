def mock_admin(admin)
  base = { :email => Faker::Internet.email, :name => Faker::Name.name }
  base.merge!(admin)
  OmniAuth.config.mock_auth[:google_apps] = OmniAuth::AuthHash.new({ :info => base })
end

def login
  visit('/')
  click_link('Login')
end

Given /^I am logged into gmail as:$/ do |table|
  mock_admin table.transpose.hashes.first
end

Given /^I am logged in$/ do
  admin = FactoryGirl.create(:admin)

  mock_admin({ :email => admin.email, :name => admin.name })

  login
end

Given /^I am logged in as:$/ do |table|
  admin = FactoryGirl.create(:admin, table.hashes.first)
  mock_admin({ :email => admin.email, :name => admin.name })
  login
end

