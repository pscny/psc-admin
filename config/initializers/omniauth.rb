Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_apps , :domain => 'pscny.org'
end
