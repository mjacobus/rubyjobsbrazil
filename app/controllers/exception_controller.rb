class ExceptionController < ApplicationController
  def index
    raise "Oh noes!"
  end
end
