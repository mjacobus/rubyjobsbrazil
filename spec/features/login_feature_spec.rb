# frozen_string_literal: true

require 'rails_helper'

feature 'User Session' do
  include Features::Login

  user_logs_in_and_out_with(Oauth::Github)
  user_logs_in_and_out_with(Oauth::Facebook)
  user_logs_in_and_out_with(Oauth::Google)
end
