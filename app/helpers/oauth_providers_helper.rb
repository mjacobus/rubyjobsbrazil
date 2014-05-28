module OauthProvidersHelper
  def available_oauth_providers
    {
      facebook: :facebook,
      google: :google_oauth2,
      github: :github,
    }.select do |key, provider|
      ENV["#{key.to_s.upcase}_KEY"]
    end
  end
end
