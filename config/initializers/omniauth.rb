Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_apps, domain: 'crowdtap.com'
end
