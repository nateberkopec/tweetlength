# This file is used by Rack-based servers to start the application.

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
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
    config.cache_classes = true
    config.eager_load = true
    config.consider_all_requests_local       = false
    config.action_controller.perform_caching = true
    config.log_level = :debug
    config.log_tags = [ :request_id ]
    config.i18n.fallbacks = true
    config.active_support.deprecation = :notify
    config.log_formatter = ::Logger::Formatter.new
    if ENV["RAILS_LOG_TO_STDOUT"].present?
      logger           = ActiveSupport::Logger.new(STDOUT)
      logger.formatter = config.log_formatter
      config.logger = ActiveSupport::TaggedLogging.new(logger)
    end

    config.secret_key_base = ENV["SECRET_KEY_BASE"]

    routes.draw do
      root to: "hello#world"
    end
  end
end

class HelloController < ActionController::Base
  protect_from_forgery with: :exception

  def world
    render plain: "Hello World!"
  end
end

Rails.application.initialize!

run Rails.application
