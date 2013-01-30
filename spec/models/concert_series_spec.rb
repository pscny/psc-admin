require 'spec_helper'

describe ConcertSeries do
  it { should be_a(Mongoid::Document) }
  it { should be_timestamped_document }

  it { should have_field(:name) }
end
