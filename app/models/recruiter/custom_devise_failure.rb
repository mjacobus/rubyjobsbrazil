# frozen_string_literal: true

module Recruiter
  class CustomDeviseFailure < Devise::FailureApp
    def redirect_url
      '/sign_in'
    end
  end
end
