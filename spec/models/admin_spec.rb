require 'spec_helper'

describe Admin do
  it { should be_a(Mongoid::Document) }
  it { should be_a(Mongoid::Timestamps) }
  it { should have_field(:name) }
end

describe Admin, '.find_or_create_from_auth_hash' do
  subject { Admin }

  before do
    subject.stubs(:find_from_auth_hash => false)
    subject.stubs(:create_from_auth_hash => false)
  end

  it 'should call .find_from_auth_hash' do
    subject.stubs(:find_from_auth_hash => true)
    subject.find_or_create_from_auth_hash({})
    subject.should have_received(:find_from_auth_hash)
    subject.should_not have_received(:create_from_auth_hash)
  end

  it "should call .create_from_auth_hash when the user can't be found" do

  end

  it { should be_a(Mongoid::Document) }
  it { should be_a(Mongoid::Timestamps) }
  it { should have_field(:name) }
end
