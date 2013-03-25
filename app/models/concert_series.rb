class ConcertSeries
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :concerts
  has_many :subscriptions

  field :name
end
