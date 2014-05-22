module Oauth
  class Google < Base
    def self.find_or_build_user(params)
      user = User.where(uid: params[:uid], provider: :google_oauth2).first

      unless user
        user = User.new
        user.uid = params[:uid]
        user.provider = 'google_oauth2'
      end

      user.email = params[:info][:email]
      user.name = params[:info][:name]
      user
    end
  end
end
