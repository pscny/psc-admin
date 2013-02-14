class Concert
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :date, :type => Date

  validates :name, :presence => true
  validates :date, :presence => true, :uniqueness => true
end
