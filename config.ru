require 'rails'
require "action_controller/railtie"

module Tweetlength
  class Application < Rails::Application
    config.secret_key_base = "X"

    routes.draw do
      root to: Proc.new { |_e| [200, {}, "Hello World!"]}
    end
  end
end

Rails.application.initialize!

run Rails.application
