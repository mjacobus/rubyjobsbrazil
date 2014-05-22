module OmniauthControllerSpecs
  extend ActiveSupport::Concern

  def stub_omniauth_with(params, origin = root_url)
    @request.env["devise.mapping"]  = Devise.mappings[:user]
    @request.env["omniauth.auth"]   = params
    @request.env["omniauth.origin"] = origin
  end

  module ClassMethods
    def it_logs_in_with(strategy_class)
      provider_key = strategy_class.provider_key

      describe "#{provider_key}" do
        let(:env) { OauthHelper.providers[provider_key]  }
        let(:user) { User.make  }

        before do
          expect(strategy_class).to receive(:find_or_build_user).with(env).and_return(user)
          stub_omniauth_with(env)
          expect(controller).to receive(:redirect_url_for).with(user, root_url).and_return(root_url)
        end

        it "saves user" do
          expect(user).to receive(:save!).with(validate: false)
          get provider_key
        end

        it "logs user in" do
          get provider_key
          expect(controller.current_user).to eq(User.last)
        end

        it "redirects to the 'redirect_url'" do
          get provider_key
          expect(response).to redirect_to(root_url)
        end

        it "presents 'login_message'" do
          get provider_key
          expect(flash[:notice]).to eq(I18n.t('system.messages.account_created'))
        end
      end
    end
  end
end
