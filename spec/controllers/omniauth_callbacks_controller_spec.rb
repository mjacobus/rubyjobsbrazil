require 'spec_helper'

describe OmniauthCallbacksController do
  include OmniauthControllerSpecs

  it_logs_in_with(Oauth::Facebook)
  it_logs_in_with(Oauth::Github)
  it_logs_in_with(Oauth::Google)

  describe "#redirect_url_for" do
    it "redirects to root path after the login" do
      expect(controller.redirect_url_for(user)).to eq(root_url)
    end
  end

  describe "#relative_path" do
    it "returns the relative path when full url is given" do
      expect(controller.relative_path('http://www.someurl.com/abc?foo=bar')).to eq('/abc?foo=bar')
      expect(controller.relative_path('https://www.someurl.com/abc?foo=bar')).to eq('/abc?foo=bar')
    end

    it "returns the param given if given url does not match given url" do
      expect(controller.relative_path('abc?foo=bar')).to eq('abc?foo=bar')
    end
  end

  pending "test invalid credentials and other auth errors"
  # context "with invalid credentials", :pending do
  #   before do
  #     OmniAuth.config.mock_auth[:github] = :invalid_credentials
  #     env = OauthHelper.providers[:github]
  #     stub_omniauth_with(env)
  #   end
  #
  #   it "redirects to root path" do
  #     get :github
  #     expect(flash[:alert]).not_to be_empty
  #   end
  #
  #   it "redirects to root path" do
  #     get :github
  #     expect(response).to redirect_to(root_path)
  #   end
  # end
end
