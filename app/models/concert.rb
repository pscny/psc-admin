class Concert
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope desc(:date)

  belongs_to :concert_series

  field :concert_series_id

  field :name
  field :date, :type => Date

  validates :name, :presence => true
  validates :date, :presence => true, :uniqueness => true
end
