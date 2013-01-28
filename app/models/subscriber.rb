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
  field :primary_phone
  field :secondary_phone
  field :email
  field :source
  field :received_at, :type => Date

  validates :first_name, :presence  => true
  validates :last_name,  :presence  => true
  validates :email,      :presence  => true, :uniqueness => true
  validates :source,     :inclusion => { :in => SOURCES }
  validates :address1,   :presence  => true
  validates :zip_code,   :presence  => true, :format => { :with => /^\d{5}-?\d{4}?$/, :message => 'should be formatted like ##### or #####-####' }
  validates :city,       :presence  => true
  validates :state,      :inclusion => { :in => PscVariables::STATES.values.map{|h|h['abbreviation']} }
  validates :primary_phone, :presence => true, :format => { :with => /^\d{3}-\d{3}-\d{4}$/, :message => 'please enter a 10 digit phone number (###-###-####)' }
  validates :secondary_phone, :format => { :with => /^\d{3}-\d{3}-\d{4}$/, :message => 'please enter a 10 digit phone number (###-###-####)' }, :allow_nil => true

  before_validation :format_phone

  def full_name
    [first_name, last_name].join(' ')
  end

  private

  def format_phone
    self.primary_phone.gsub!(/\D*/,'')
    self.primary_phone = [ primary_phone.slice(0,3), primary_phone.slice(3,3), primary_phone.slice(6,4) ].join('-')
  end
end
