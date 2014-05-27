module ControllersSpecHelpers
  extend ActiveSupport::Concern

  module ClassMethods
    def it_requires_authentication(&block)
      it "requires authentication" do
        instance_eval(&block)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    def it_responds_with_success(&block)
      it "responds with success" do
        instance_eval(&block)
        expect(response).to be_success
      end
    end

    def it_renders_template(template, &block)
      it "renders template #{template}" do
        instance_eval(&block)
        expect(response).to render_template(template)
      end
    end
  end
end
