require 'rails'
require "action_controller/railtie"

module Tweetlength
  class Application < Rails::Application
    config.secret_key_base = "X"

    routes.draw do
      root to: "hello#world"
    end
  end
end

class HelloController < ActionController::Base
  def world
    render plain: "Hello World!"
  end
end

Rails.application.initialize!

run Rails.application
