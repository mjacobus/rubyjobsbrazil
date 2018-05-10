# frozen_string_literal: true

module Users
  class UserController < ApplicationController
    before_action :authenticate_user!
    respond_to :html, :json
  end
end
