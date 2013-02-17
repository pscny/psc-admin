class ConcertSeries
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :season
  validates_associated :season
  validates :season_id, :presence => true

  field :name
end
