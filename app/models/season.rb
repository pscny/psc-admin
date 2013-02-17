class Season
  include Mongoid::Document
  include Mongoid::Timestamps

  EPOCH_OFFSET = 1899

  has_many :concert_series

  default_scope desc(:start)

  field :season,     :type => Integer
  field :start_date, :type => Date
  field :end_date,   :type => Date

  before_validation :set_start_date, :set_end_date

  validates :season,     :presence => true, :uniqueness => true
  validates :start_date, :presence => true, :uniqueness => true
  validates :end_date,   :presence => true, :uniqueness => true

  def to_s
    "#{season.ordinalize} Season (#{start_date.year} - #{end_date.year})"
  end

  private

  def set_start_date
    self.start_date = Date.parse("1/6/#{season + EPOCH_OFFSET}")
  end

  def set_end_date
    self.end_date   = Date.parse("31/5/#{season + EPOCH_OFFSET + 1}")
  end
end
