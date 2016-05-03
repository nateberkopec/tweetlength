require "action_controller/railtie";run Class.new(Rails::Application){config.secret_key_base=?x;}.initialize!
