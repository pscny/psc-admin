require 'spec_helper'

describe Concert do
  it { should be_a(Mongoid::Document) }
  it { be_timestamped_document }
  it { should have_field(:name) }
  it { should have_field(:date).of_type(Date) }
end
