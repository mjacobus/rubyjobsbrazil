module OmniauthModelSpecs
  extend ActiveSupport::Concern

  module ClassMethods
    def it_behaves_like_a_strategy_model(model_class, strategy_key)
      let(:params) { OauthHelper.providers[strategy_key]  }

      let(:existing_user) do
        user = model_class.find_or_build_user(params)
        user.save!
        user
      end

      describe ".find_or_build_user" do
        context "when user does not exist" do
          it "builds a new user" do
            user = model_class.find_or_build_user(params)
            expect(user).to be_a(User)
            expect(user).not_to be_persisted
            expect(user).to be_new_record
          end

          it "assigns correct data to users" do
            user = model_class.find_or_build_user(params)
            expect(user.uid).to eq(params[:uid])
            expect(user.provider.to_s).to eq(strategy_key.to_s)
            expect(user.email).to eq(params[:info][:email])
            expect(user.name).to eq(params[:info][:name])
          end
        end

        context "when user does exist" do
          it "does not create an user" do
            existing_user
            user = model_class.find_or_build_user(params)
            expect(user.id).to eq(existing_user.id)
            expect(user).not_to be_new_record
          end

          it "updates data when user changes it" do
            existing_user.email = 'another@email.com'
            existing_user.name = 'another name'
            existing_user.save(validate: false)
            user = model_class.find_or_build_user(params)
            expect(user.email).to eq(params[:info][:email])
            expect(user.name).to eq(params[:info][:name])
          end
        end
      end
    end
  end
end
