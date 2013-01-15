class Admin
  include Mongoid::Document
  include Mongoid::Timestamps

  before_create :set_salt, :encrypt_password

  attr_accessor :password

  field :name
  field :email
  field :encrypted_password
  field :salt

  def self.authenticate(email, password)
    return nil   if     email.blank? or password.blank?
    puts where(:email => email)
    puts where(:email => email).first
    return nil   unless admin = where(:email => email).first
    return admin if     admin.authenticated?(password)
  end

  def authenticated?(password)
    encrypted_password == encrypt(password)
  end

  private

  def set_salt
    self.salt = generate_hash("--#{ Time.now.utc }--#{ rand }--#{ id }--")
  end

  def encrypt_password
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    generate_hash("--#{ salt }--#{ string }--")
  end

  def generate_hash(string)
    Digest::SHA1.hexdigest(string)
  end
end
