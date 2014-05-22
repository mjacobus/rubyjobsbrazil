module Features
  module Login
    extend ActiveSupport::Concern

    def login_with_strategy(strategy_class)
      click_link t("system.links.login.#{strategy_class.provider_key}")
    end

    def logout
      click_link(t('system.links.logout'))
    end

    module ClassMethods
      def user_logs_in_and_out_with(strategy_class)

        scenario "user logs in and out with #{strategy_class.provider_key}" do
          visit root_path

          login_with_strategy(strategy_class)
          expect(page).to have_text(t('system.messages.account_created'))

          logout
          expect(page).to have_text(t('devise.sessions.signed_out'))

          login_with_strategy(strategy_class)
          expect(page).to have_text(t('system.messages.login_succeed'))
        end

      end
    end
  end
end

