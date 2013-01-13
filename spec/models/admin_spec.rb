require 'spec_helper'

describe Admin do
  it { should have_field(:name) }
  it { should have_field(:email) }
  it { should have_field(:encrypted_password) }
  it { should have_field(:salt) }
end

describe Admin, 'encrypted password' do
  subject { FactoryGirl.build(:admin) }

  it 'sets a salted password on create' do
    subject.encrypted_password.should be_nil
    subject.password = 'password'
    subject.save
    subject.encrypted_password.should_not be_nil
  end
end

describe Admin, '.authenticate' do
  subject do
    FactoryGirl.create(:admin, :email    => 'this@example.com',
                               :password => 'p@sswerd')
  end

  it 'returns a user when the password matches' do
    subject.should == Admin.authenticate(:email    => 'this@example.com',
                                         :password => 'p@sswerd')
  end
end
