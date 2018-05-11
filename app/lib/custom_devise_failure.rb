# frozen_string_literal: true

class CustomDeviseFailure < Devise::FailureApp
  def redirect_url
    '/sign_in'
  end
end
