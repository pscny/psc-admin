require 'spec_helper'

describe Season do
  it { should be_a(Mongoid::Document) }
  it { be_timestamped_document }

  it { should have_field(:season).of_type(Integer) }
  it { should validate_presence_of(:season) }
  it { should validate_uniqueness_of(:season) }

  it { should have_field(:start_date).of_type(Date) }
  it { should validate_presence_of(:start_date) }
  it { should validate_uniqueness_of(:start_date) }

  it { should have_field(:end_date).of_type(Date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_uniqueness_of(:end_date) }

  it { should have_many(:concert_series) }
end

describe Season, 'before validate' do
  subject { build(:season, :season => 113) }

  it 'sets the start date based of the season' do
    subject.valid?
    subject.start_date.should == Date.parse('1/6/2012')
  end

  it 'sets the end date based of the season' do
    subject.valid?
    subject.end_date.should == Date.parse('31/5/2013')
  end
end

describe Season, "#to_s" do
  subject { create(:season, :season => 251) }
  its(:to_s) { should == '251st Season (2150 - 2151)' }
end
