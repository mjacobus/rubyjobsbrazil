require 'spec_helper'

describe Users::JobsController do
  include ControllersSpecHelpers

  def valid_attributes
    {
      description: 'description',
      title: 'title',
      how_to_apply: 'how to'
    }
  end

  def invalid_attributes
    {
      description: '',
      title: '',
      how_to_apply: ''
    }
  end

  describe "#index" do
    it_requires_authentication do
      get :index
    end

    with_valid_user do
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
  end

  describe "#edit" do
    it_requires_authentication do
      get :edit, id: 1
    end

    with_valid_user do
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

  describe "#show" do
    it_requires_authentication do
      get :show, id: 1
    end

    with_valid_user do
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
  end

  describe "#new" do
    it_requires_authentication do
      get :new
    end

    with_valid_user do
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
  end

  describe "#create" do
    it_requires_authentication do
      post :create
    end

    with_valid_user do
      describe "with valid attribbutes" do
        it "creates a new record" do
          expect do
            post :create, job: valid_attributes
          end.to change { user.jobs.count }.by(1)
        end

        it "redirects to #show" do
          post :create, job: valid_attributes
          expect(response).to redirect_to(Job.last)
        end

        it_sets_flash_message :notice do
          post :create, job: valid_attributes
        end
      end

      describe "with invalid attributes" do
        it_responds_with_success do
          post :create, job: invalid_attributes
        end

        it_renders_template :new do
          post :create, job: invalid_attributes
        end

        it_sets_flash_message :alert, true do
          post :create, job: invalid_attributes
        end
      end
    end
  end


  describe "#update" do
    it_requires_authentication do
      patch :update, id: 1
    end

    with_valid_user do
      describe "with valid attributes" do
        it "updates record" do
          job = Job.make!(user: user)

          expect do
            patch :update, id: job.id, job: valid_attributes.merge(description: 'new_description')
            job.reload
          end.to change { job.description }.to('new_description')
        end

        it "redirects to #show" do
          job = Job.make!(user: user)
          patch :update, id: job.id, job: valid_attributes.merge(description: 'new_description')
          expect(response).to redirect_to(Job.last)
        end

        it_sets_flash_message :notice do
          job = Job.make!(user: user)
          patch :update, id: job.id, job: valid_attributes.merge(description: 'new_description')
        end

      end

      describe "with invalid attributes" do
        it_responds_with_success do
          job = Job.make!(user: user)
          patch :update, id: job.id, job: invalid_attributes
        end

        it_renders_template :edit do
          job = Job.make!(user: user)
          patch :update, id: job.id, job: invalid_attributes
        end

        it_sets_flash_message :alert, true do
          job = Job.make!(user: user)
          patch :update, id: job.id, job: invalid_attributes
          post :create, job: invalid_attributes
        end
      end

    end
  end

  describe "#destroy" do
    it_requires_authentication do
      delete :destroy, id: 1
    end

    with_valid_user do
      it "destroys a record" do
        job = Job.make!(user: user)

        expect do
          delete :destroy, id: job.id
        end.to change { user.jobs.count }.by(-1)
      end

      it "redirects to #index" do
        job = Job.make!(user: user)
        delete :destroy, id: job.id
        expect(response).to redirect_to(:jobs)
      end

      it_sets_flash_message :notice do
        job = Job.make!(user: user)
        delete :destroy, id: job.id
      end
    end
  end
end
