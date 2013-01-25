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
  field :received_at, :type => DateTime

  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  validates :email,      :presence => true, :uniqueness => true
  validates :source,     :inclusion => { :in => SOURCES }

  validates :address1,   :presence => true
  validates :zip_code,   :presence => true, :format => { :with => /^\d{5}-?\d{4}?$/, :message => 'should be formatted like ##### or #####-####' }
  validates :city,       :presence => true
  validates :state,      :inclusion => { :in => PscVariables::STATES.values.map{|h|h['abbreviation']} }

  def full_name
    [first_name, last_name].join(' ')
  end
end
