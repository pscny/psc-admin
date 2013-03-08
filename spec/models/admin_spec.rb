require 'spec_helper'

describe Admin do
  it { should be_a(Mongoid::Document) }
  it { should be_a(Mongoid::Timestamps) }
  it { should have_field(:name) }
  it { should have_field(:email) }
  it { should have_field(:active).of_type(Boolean).with_default_value_of(true) }
end

describe Admin, '.find_or_create_from_auth_hash' do
  subject      { Admin }
  let(:params) { { :some => :values } }

  before do
    subject.stubs(:find_from_auth_hash   => false)
    subject.stubs(:create_from_auth_hash => false)
  end

  it 'should call .find_from_auth_hash' do
    subject.stubs(:find_from_auth_hash => true)

    subject.find_or_create_from_auth_hash({})

    subject.should have_received(:find_from_auth_hash).with({})
    subject.should have_received(:create_from_auth_hash).never
  end

  it "should call .create_from_auth_hash when the user can't be found" do
    subject.stubs(:find_from_auth_hash => false)

    subject.find_or_create_from_auth_hash({})

    subject.should have_received(:find_from_auth_hash).with({})
    subject.should have_received(:create_from_auth_hash).with({})
  end
end

describe Admin, '.find_from_auth_hash' do
  subject        { Admin }
  let(:params)   { Hashie::Mash.new({ :info => { :email => 'admin@example.com' } }) }
  let(:criteria) { stub(:first => nil) }

  before { Admin.stubs(:where => criteria) }

  it 'searches for an admin by email address' do
    subject.find_from_auth_hash(params)
    Admin.should have_received(:where).with({:email => 'admin@example.com'})
  end
end

describe Admin, '.create_from_auth_hash' do
  subject        { Admin }
  let(:params) do
    Hashie::Mash.new({
      :info => {
        :email => 'admin@example.com',
        :name  => 'First McLast'
      }
    })
  end
  let(:criteria) { stub(:first => nil) }

  before do
    Admin.stubs(:where => criteria)
    Admin.stubs(:create!)
  end

  it 'creates an admin from the email address and name' do
    subject.create_from_auth_hash(params)
    Admin.should have_received(:create!).with({
      :email => 'admin@example.com',
      :name  => 'First McLast'
    })
  end
end

describe Admin, '#deactivate!' do
  subject { create(:admin, :active => true ) }

  it 'should set active to false' do
    subject.should be_active
    subject.deactivate!
    subject.should_not be_active
  end
end
