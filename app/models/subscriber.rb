class Subscriber
  include Mongoid::Document
  include Mongoid::Timestamps

  SOURCES = %w{ brochure concert online order renewal }

  field :first_name
  field :last_name
  field :address1
  field :address2
  field :city
  field :state
  field :zip_code
  field :state
  field :zip_code
  field :primary_phone
  field :secondary_phone
  field :email
  field :source
  field :received_at

  def full_name
    [first_name, last_name].join(' ')
  end
end
