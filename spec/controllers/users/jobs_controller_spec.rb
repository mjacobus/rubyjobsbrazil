require 'spec_helper'

describe Users::JobsController do
  include ControllersSpecHelpers

  def valid_attributes
    {
      job: {
        description: 'description',
        title: 'title',
        how_to_apply: 'how to'
      }
    }
  end

  def invalid_attributes
    {
      job: {
        description: '',
        title: '',
        how_to_apply: ''
      }
    }
  end

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

    describe "#create" do
      describe "with valid attribbutes" do

        it "creates a new record" do
          expect do
            post :create, valid_attributes
          end.to change { user.jobs.count }.by(1)
        end

        it "redirects to #index" do
          post :create, valid_attributes
          expect(response).to redirect_to(Job.last)
        end

      end

      describe "with invalid attributes" do

        it_responds_with_success do
          post :create, invalid_attributes
        end

        it_renders_template :new do
          post :create, invalid_attributes
        end

      end
    end

  end
end
