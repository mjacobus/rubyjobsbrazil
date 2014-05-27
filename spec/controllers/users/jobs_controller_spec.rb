require 'spec_helper'

describe Users::JobsController do
  include ControllersSpecHelpers

  it_requires_authentication_for :get, :index

  context "when user is logged in" do
    before do
      sign_in(user)
    end

    describe "#index" do
      it "lists the posts that the user posted" do
        Job.make! # another user job
        job = Job.make!(user: user)
        get :index
        expect(assigns(:jobs)).to eq([job])
      end

      it_responds_with_success :get, :index
      it_renders_template :index, :get, :index
    end
  end
end
