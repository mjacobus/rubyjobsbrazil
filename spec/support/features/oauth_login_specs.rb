module Features
  module Login
    extend ActiveSupport::Concern

    def login_with_strategy(strategy_class)
      click_link t("recruiter.links.login.#{strategy_class.provider_key}")
      # click_href user_omniauth_authorize_path(strategy_class.provider_key)
      # click_href "/users/auth/#{strategy_class.provider_key}"
    end

    def click_href(href)
      find(:xpath, "//a[@href='#{href}']").click
    end

    def logout
      click_link(t('recruiter.links.logout'))
    end

    module ClassMethods
      def user_logs_in_and_out_with(strategy_class)

        scenario "user logs in and out with #{strategy_class.provider_key}" do
          visit recruiter.root_path

          login_with_strategy(strategy_class)
          expect(page).to have_text(t('recruiter.messages.account_created'))

          logout
          expect(page).to have_text(t('devise.sessions.signed_out'))

          login_with_strategy(strategy_class)
          expect(page).to have_text(t('recruiter.messages.login_succeed'))
        end

      end
    end
  end
end

