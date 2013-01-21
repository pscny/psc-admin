require 'spec_helper'

describe Subscriber do
  it { should be_a(Mongoid::Document) }
  it { should be_a(Mongoid::Timestamps) }

  it { should have_field(:first_name) }
  it { should have_field(:last_name) }
  it { should have_field(:address1) }
  it { should have_field(:address2) }
  it { should have_field(:city) }
  it { should have_field(:state) }
  it { should have_field(:zip_code) }
  it { should have_field(:primary_phone) }
  it { should have_field(:secondary_phone) }
  it { should have_field(:email) }
  it { should have_field(:source) }
  it { should have_field(:received_at) }
end

describe Subscriber, '#name' do
  subject { create(:subscriber, :first_name => 'Tim', :last_name => 'Bell') }

  it 'returns the members full name' do
    subject.full_name.should == 'Tim Bell'
  end
end
