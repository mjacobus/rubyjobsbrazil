# frozen_string_literal: true

module OauthProvidersHelper
  def available_oauth_providers
    {
      github: :github,
      google: :google_oauth2,
      facebook: :facebook,
    }.select do |key, _provider|
      ENV["#{key.to_s.upcase}_KEY"]
    end
  end

  def provider_icon(provider)
    icon(provider_icon_class(provider))
  end

  def provider_icon_class(provider)
    {
      google_oauth2: 'social-google-plus',
    }.fetch(provider.to_sym) { "social-#{provider}" }
  end

  def user_omniauth_authorize_path(provider)
    method = "user_#{provider}_omniauth_authorize_path"
    send(method)
  end
end
