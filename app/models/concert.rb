class Concert
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :date, :type => Date
end
