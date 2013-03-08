Given /^I am logged into gmail as:$/ do |table|
  base_admin = {
    :email      => Faker::Internet.email,
    :first_name => 'Jonathon',
    :last_name  => 'Storer',
    :name       => Faker::Name.name
  }

  admin = table.transpose.hashes.first

  base_admin.merge!(admin)

  OmniAuth.config.mock_auth[:google_apps] = OmniAuth::AuthHash.new({
    :provider => 'google_apps',
    :uid      => 'http://pscny.org/openid?id=104471331717335644878',
    :info     => base_admin
  })
end
