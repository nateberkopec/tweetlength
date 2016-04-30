class HelloController < ApplicationController
  def world
    render plain: "Hello World!"
  end
end
