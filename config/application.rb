require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Importantizer
  class Application < Rails::Application
    # config.action_dispatch.default_headers.merge!({'X-Frame-Options' => 'ALLOWALL'})
  # config.web_console.whitelisted_ips = '52.2.254.27'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
