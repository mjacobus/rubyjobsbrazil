# frozen_string_literal: true

class OmniauthCallbacksController < ::Devise::OmniauthCallbacksController
  # For handling errors
  def new_session_path(_scope)
    new_user_session_path
  end

  def facebook
    login_with(Recruiter::Oauth::Facebook)
  end

  def google_oauth2
    login_with(Recruiter::Oauth::Google)
  end

  def github
    login_with(Recruiter::Oauth::Github)
  end

  def login_with(klass)
    env          = request.env['omniauth.auth']
    origin       = request.env['omniauth.origin']
    user         = klass.find_or_build_user(env)
    redirect_url = redirect_url_for(user, origin)
    message      = login_message(user)
    user.save!(validate: false)
    sign_in(user, event: :authentication)
    redirect_to redirect_url, notice: message, only_path: true
  end

  def login_message(user)
    key = user.new_record? ? 'account_created' : 'login_succeed'
    I18n.t("recruiter.messages.#{key}")
  end

  def redirect_url_for(_user, origin = nil)
    origin || root_url
  end

  def relative_path(url)
    matches = url.match(/^http(s)?:\/\/[^\/]+(.*)/)
    matches ? matches[2] : url
  end
end
