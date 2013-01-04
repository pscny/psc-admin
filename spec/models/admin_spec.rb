require 'spec_helper'

describe Admin do
  it { should have_field(:email) }
  it { should have_field(:password) }
end
