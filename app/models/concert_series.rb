class ConcertSeries
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :concerts

  field :name
end
