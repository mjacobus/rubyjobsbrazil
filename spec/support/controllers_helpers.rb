module ControllersSpecHelpers
  extend ActiveSupport::Concern

  module ClassMethods
    def it_requires_authentication_for(method, action, params = {})
      it "requires authentication for #{method} #{action}" do
        send(method, action, params)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
