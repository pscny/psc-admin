require 'spec_helper'

describe Admin do
  it { should be_a(Mongoid::Document) }
  it { should be_a(Mongoid::Timestamps) }
  it { should have_field(:name) }
end
