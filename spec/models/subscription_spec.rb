require 'spec_helper'

describe Subscription do
  it { should be_a(Mongoid::Document) }
  it { should be_timestamped_document }

  it { should belong_to(:member) }

  it { should have_field(:quantity).of_type(Integer) }
  it { should have_field(:reserved).of_type(Boolean) }
  it { should have_field(:seat_or_ticket_number) }

  it { should validate_numericality_of(:quantity).greater_than(0) }
  it { should validate_presence_of(:seat_or_ticket_number) }

end
