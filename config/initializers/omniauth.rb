OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1469831699939046', '9438bf3eabb0789c9d0959ac97dc2394'
end

