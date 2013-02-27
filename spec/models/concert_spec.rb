require 'spec_helper'

describe Concert do
  it { should be_a(Mongoid::Document) }
  it { should be_timestamped_document }

  it { should belong_to(:concert_series) }

  it { should have_field(:date).of_type(Date) }
  it { should validate_presence_of(:date) }
  it { should validate_uniqueness_of(:date) }

  it { should have_field(:name) }
  it { should validate_presence_of(:name) }
end
