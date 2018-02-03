

Unsplash.configure do |config|
  config.application_id     = "INSERT_OWN_ID_FROM_UNSPLASH_API"
  config.application_secret = "INSERT_OWN_SECRET_FROM_UNSPLASH_API"
  config.application_redirect_uri = "https://your-application.com/oauth/callback"
  config.utm_source = "alices_terrific_client_app"
end
