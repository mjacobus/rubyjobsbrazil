require 'spec_helper'

describe Oauth::Google do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:params) { OauthHelper.providers[:google_oauth2]  }

  let(:existing_user) do
    user = Oauth::Google.find_or_build_user(params)
    user.save!
    user
  end

  describe ".find_or_build_user" do

    context "when user does not exist" do
      it "builds a new user" do
        user = Oauth::Google.find_or_build_user(params)
        expect(user).to be_a(User)
        expect(user).not_to be_persisted
        expect(user).to be_new_record
      end

      it "assigns correct data to users" do
        user = Oauth::Google.find_or_build_user(params)
        expect(user.uid).to eq(params[:uid])
        expect(user.provider).to eq('google_oauth2')
        expect(user.email).to eq(params[:info][:email])
        expect(user.name).to eq(params[:info][:name])
      end
    end

    context "when user does exist" do
      it "does not create an user" do
        existing_user
        user = Oauth::Google.find_or_build_user(params)
        expect(user.id).to eq(existing_user.id)
        expect(user).not_to be_new_record
      end

      it "updates data when user changes it" do
        existing_user.email = 'another@email.com'
        existing_user.name = 'another name'
        existing_user.save(validate: false)
        user = Oauth::Google.find_or_build_user(params)
        expect(user.email).to eq(params[:info][:email])
        expect(user.name).to eq(params[:info][:name])
      end
    end
  end
end
