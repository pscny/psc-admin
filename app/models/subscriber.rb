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

  validates :first_name,      :presence  => true
  validates :last_name,       :presence  => true
  validates :email,           :presence  => true, :uniqueness => true, :allow_nil => true
  validates :source,          :inclusion => { :in => SOURCES }
  validates :address1,        :presence  => true, :if => 'address2.present?'
  validates :zip_code,        :presence  => true, :format => { :with => /^\d{5}-?\d{4}?$/, :message => 'should be formatted like ##### or #####-####' }
  validates :city,            :presence  => true, :allow_nil => true
  validates :state,           :inclusion => { :in => PscVariables::STATES.values.map{|h|h['abbreviation']}, :allow_nil => true }
  validates :primary_phone,   :format    => { :with => /^\d{3}-\d{3}-\d{4}$/, :message => 'please enter the phone number in the following format ###-###-####' }, :presence  => true, :allow_nil => true
  validates :secondary_phone, :format    => { :with => /^\d{3}-\d{3}-\d{4}$/, :message => 'please enter the phone number in the following format ###-###-####' }, :allow_nil => true

  before_validation :format_primary_phone,   :if => 'primary_phone.present?'
  before_validation :format_secondary_phone, :if => 'secondary_phone.present?'

  def full_name
    [first_name, last_name].join(' ')
  end

  private

  def format_primary_phone
    format_phone(:primary_phone)
  end

  def format_secondary_phone
    format_phone(:secondary_phone)
  end

  def format_phone(field)
    phone = send(field)
    phone = phone.gsub(/\D*/,'')
    phone = [ phone.slice(0,3), phone.slice(3,3), phone.slice(6,4) ].join('-')
    send("#{field}=", phone)
  end
end
