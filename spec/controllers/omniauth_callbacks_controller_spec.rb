require 'spec_helper'

describe OmniauthCallbacksController do
  include OmniauthControllerSpecs

  it_logs_in_with(Oauth::Facebook)
  it_logs_in_with(Oauth::Github)
  it_logs_in_with(Oauth::Google)

  describe "#redirect_url_for" do
    it "redirects to root path after the login" do
      expect(controller.redirect_url_for(user)).to eq(root_path)
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
end
