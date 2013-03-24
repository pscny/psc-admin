require 'spec_helper'

describe Member do
  it { should be_a(Mongoid::Document) }
  it { should be_timestamped_document }

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
  it { should have_field(:received_at).of_type(Date) }
  it { should have_field(:mailing_list).of_type(Boolean) }
end

describe Member, 'validations' do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_format_of(:email).to_allow('handle@domain.com').not_to_allow('bad@bad') }
  it { should validate_inclusion_of(:source).to_allow(%w{ brochure concert online renewal }) }
  it { should validate_presence_of(:address1) }
  it { should validate_inclusion_of(:state).to_allow(PscVariables::STATES.values.map{|h|h['abbreviation']}) }
  it { should validate_format_of(:zip_code).to_allow('12345').not_to_allow('1234') }
  it { should validate_format_of(:zip_code).to_allow('12345-4321').not_to_allow('1234-12345') }
  it { should validate_format_of(:primary_phone).to_allow('111-222-3333').not_to_allow('111222333') }
  it { should validate_format_of(:secondary_phone).to_allow('111-222-3333').not_to_allow('111222333') }
end

describe Member, 'validations on nil values' do
  subject { build(:member) }

  it 'allows email to be nil' do
    subject.email = nil
    subject.should be_valid
  end

  it 'allows address1 to be nil' do
    subject.address1 = nil
    subject.should be_valid
  end

  it 'allows address2 to be nil' do
    subject.address2 = nil
    subject.should be_valid
  end

  it 'requires address1 if address2 is not nil' do
    subject.address1 = nil
    subject.address2 = 'something'
    subject.should_not be_valid
  end

  it 'allows city to be nil' do
    subject.city = nil
    subject.should be_valid
  end

  it 'allows state to be nil' do
    subject.state = nil
    subject.should be_valid
  end

  it 'allows primary phone to be nil' do
    subject.primary_phone = nil
    subject.should be_valid
  end

  it 'allows secondary phone to be nil' do
    subject.secondary_phone = nil
    subject.should be_valid
  end
end

describe Member, '#name' do
  subject { create(:member, :first_name => 'Tim', :last_name => 'Bell') }

  it 'returns the members full name' do
    subject.full_name.should == 'Tim Bell'
  end
end

describe Member, 'before validation' do
  subject { build(:member, :primary_phone => '111.222/33.33', :secondary_phone => '1112223333') }

  it 'strips formatting' do
    subject.valid?
    subject.primary_phone.should   == '111-222-3333'
    subject.secondary_phone.should == '111-222-3333'
  end

  it 'strips formatting' do
    subject.should be_valid
  end
end
