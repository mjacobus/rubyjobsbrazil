require 'spec_helper'

describe Users::JobsController do
  let(:user) { User.make! }

  context "when user is logged in" do
    before do
      sign_in(user)
    end

    describe "#index" do
      it "lists the posts that the user posted" do
        Job.make!
        job = Job.make!(user: user)

        get :index

        expect(assigns(:jobs)).to eq([job])
      end
    end
  end
end
