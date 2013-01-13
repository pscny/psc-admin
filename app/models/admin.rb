class Admin
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :email
  field :password

end
