require 'spec_helper'

describe ConcertSeries do
  it { should be_a(Mongoid::Document) }
  it { should be_timestamped_document }

  it { should have_many(:concerts) }
  it { should have_many(:subscriptions) }

  it { should have_field(:name) }
end
