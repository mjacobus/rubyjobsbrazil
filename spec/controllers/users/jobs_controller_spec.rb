require 'spec_helper'

describe Users::JobsController do
  include ControllersSpecHelpers

  it_requires_authentication do
    get :index
  end

  context "when user is logged in" do
    before { sign_in(user) }

    describe "#index" do
      it "lists the posts that the user posted" do
        Job.make! # another user job
        job = Job.make!(user: user)
        get :index
        expect(assigns(:jobs)).to eq([job])
      end

      it_responds_with_success do
        get :index
      end

      it_renders_template :index do
        get :index
      end
    end

    describe "#show" do
      let(:job) { Job.make!(user: user) }

      it "assigns job to @job" do
        get :show, id: job.id
        expect(assigns(:job)).to eq(job)
      end

      it_responds_with_success do
        get :show, id: job.id
      end

      it_renders_template :show do
        get :show, id: job.id
      end
    end

    describe "#new" do
      it "assigns a new record to @job" do
        get :new
        expect(assigns(:job)).to be_a_new(Job)
        expect(assigns(:job).user).to eq(user)
      end

      it_responds_with_success do
        get :new
      end

      it_renders_template :new do
        get :new
      end
    end

    describe "#edit" do
      let(:job) { Job.make!(user: user) }

      it "assigns job to @job" do
        get :edit, id: job.id
        expect(assigns(:job)).to eq(job)
      end

      it_responds_with_success do
        get :edit, id: job.id
      end

      it_renders_template :edit do
        get :edit, id: job.id
      end
    end
  end
end
