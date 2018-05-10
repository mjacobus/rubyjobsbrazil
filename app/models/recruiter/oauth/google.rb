# frozen_string_literal: true

module Recruiter
  module Oauth
    class Google < Base
      def self.provider_key
        :google_oauth2
      end
    end
  end
end
