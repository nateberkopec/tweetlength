require_relative 'boot'

require 'rails'

# require "active_record/railtie"
require "action_controller/railtie"
# require "action_view/railtie"
# require "action_mailer/railtie"
# require "active_job/railtie"
# require "action_cable/engine"
# require "rails/test_unit/railtie"
# require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tweetlength
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.secret_key_base = ENV["SECRET_KEY_BASE"]
  end
end

class HelloController < ActionController::Base
  protect_from_forgery with: :exception

  def world
    render plain: "Hello World!"
  end
end
