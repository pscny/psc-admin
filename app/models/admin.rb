class Admin
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :email
  field :active, :type => Boolean, :default => true

  def self.find_or_create_from_auth_hash(auth_hash)
    find_from_auth_hash(auth_hash) || create_from_auth_hash(auth_hash)
  end

  def self.find_from_auth_hash(auth_hash)
    where(:email => auth_hash.info.email).first
  end

  def self.create_from_auth_hash(auth_hash)
    create!({
      :email => auth_hash.info.email,
      :name  => auth_hash.info.name
    })
  end

  def deactivate!
    set(:active, false)
    true
  end
end
