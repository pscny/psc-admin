SimpleSession.configure do |config|
  config.user_model = :member
  config.uid_field  = :remember_me_token
end
