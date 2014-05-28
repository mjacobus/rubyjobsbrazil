class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CrudFlashMessagerHelper

  def page
    params[:page]
  end

  def per_page
    params[:per_page]
  end
end
