require 'rails'
require "action_controller/railtie"

class Tweetlength < Rails::Application
  config.secret_key_base = "X"

  routes.draw do
    root to: Proc.new { |_e| [200, {}, "Hello World!"]}
  end
end

run Rails.application.initialize!
