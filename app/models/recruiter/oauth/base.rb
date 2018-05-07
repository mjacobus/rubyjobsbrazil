module Recruiter
  module Oauth
    class Base
      def self.provider_key
        to_s.underscore.split('/').last.to_sym
      end

      def self.find_or_build_user(params)
        user = User.where(uid: params[:uid], provider: provider_key).first

        unless user
          user          = User.new
          user.uid      = params[:uid]
          user.provider = provider_key
        end

        user.provider_data = params
        user.email         = params[:info][:email]
        user.name          = params[:info][:name]
        user
      end
    end
  end
end
