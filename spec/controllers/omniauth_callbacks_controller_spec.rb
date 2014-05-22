require 'spec_helper'

describe OmniauthCallbacksController do
  include Records

  describe "#facebook" do
    let(:env) { OauthHelper.providers[:facebook]  }
    let(:user) { User.make  }

    before do
      expect(Oauth::Facebook).to receive(:find_or_build_user).with(env).and_return(user)
      stub_omniauth_with(env)
      expect(controller).to receive(:redirect_url_for).with(user, root_url).and_return(root_url)
    end

    it "saves user" do
      expect(user).to receive(:save!).with(validate: false)
      get :facebook
    end

    it "logs user in" do
      get :facebook
      expect(controller.current_user).to eq(User.last)
    end

    it "redirects to the 'redirect_url'" do
      get :facebook
      expect(response).to redirect_to(root_url)
    end

    it "presents 'login_message'" do
      get :facebook
      expect(flash[:notice]).to eq(I18n.t('system.messages.account_created'))
    end
  end

  describe "#google_oauth2" do
    let(:env) { OauthHelper.providers[:google_oauth2]  }
    let(:user) { User.make  }

    before do
      expect(Oauth::Google).to receive(:find_or_build_user).with(env).and_return(user)
      stub_omniauth_with(env)
      expect(controller).to receive(:redirect_url_for).with(user, root_url).and_return(root_url)
    end

    it "saves user", :focus do
      expect(user).to receive(:save!).with(validate: false)
      get :google_oauth2
    end

    it "logs user in" do
      get :google_oauth2
      expect(controller.current_user).to eq(User.last)
    end

    it "redirects to the 'redirect_url'" do
      get :google_oauth2
      expect(response).to redirect_to(root_url)
    end

    it "presents 'login_message'" do
      get :google_oauth2
      expect(flash[:notice]).to eq(I18n.t('system.messages.account_created'))
    end
  end

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

  def stub_omniauth_with(params, origin = root_url)
    @request.env["devise.mapping"]  = Devise.mappings[:user]
    @request.env["omniauth.auth"]   = params
    @request.env["omniauth.origin"] = origin
  end

end
