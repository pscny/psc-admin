class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :member

  field :quantity, :type => Integer
  field :reserved, :type => Boolean
  field :seat_or_ticket_number

  validates :seat_or_ticket_number, :presence  => true
  validates :quantity, :numericality => { :greater_than => 0 }

end
