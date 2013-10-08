OAUTH_PROVIDERS = [:facebook]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
    APP_CONFIG['facebook']['app_id'],
    APP_CONFIG['facebook']['app_secret']
end
