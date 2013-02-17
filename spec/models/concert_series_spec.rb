require 'spec_helper'

describe ConcertSeries do
  it { should be_a(Mongoid::Document) }
  it { should be_timestamped_document }

  it { should have_field(:name) }

  it { should belong_to(:season) }
  it { should validate_associated(:season) }
  it { should validate_presence_of(:season_id) }
end
