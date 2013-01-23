require 'spec_helper'

describe Subscriber do
  it { should be_a(Mongoid::Document) }
  it { be_timestamped_document }

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
  it { should have_field(:received_at).of_type(DateTime) }
end

describe Subscriber, 'validations' do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_inclusion_of(:source).to_allow(%w{ brochure concert online order renewal }) }
  it { should validate_presence_of(:address1) }
  it { should validate_presence_of(:city) }
  it { should validate_inclusion_of(:state).to_allow(PscVariables::STATES.values.map{|h|h['abbreviation']}) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_format_of(:zip_code).to_allow('12345').to_allow('12345-4321').not_to_allow('1234-12345') }

end

describe Subscriber, '#name' do
  subject { create(:subscriber, :first_name => 'Tim', :last_name => 'Bell') }

  it 'returns the members full name' do
    subject.full_name.should == 'Tim Bell'
  end
end
