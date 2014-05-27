module ControllersSpecHelpers
  extend ActiveSupport::Concern

  module ClassMethods
    def it_requires_authentication_for(method, action, params = {})
      it "requires authentication for #{method} #{action}" do
        send(method, action, params)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    def it_responds_with_success(method, action, params = {})
      it "responds with success" do
        send(method, action, params)
        expect(response).to be_success
      end
    end

    def it_renders_template(template, method, action, params = {})
      it "renders template #{template}" do
        send(method, action, params)
        expect(response).to render_template(template)
      end
    end
  end
end
