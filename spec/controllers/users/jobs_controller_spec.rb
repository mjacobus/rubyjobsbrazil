require 'spec_helper'

describe Users::JobsController do
  include ControllersSpecHelpers

  let(:tag) { Tag.make! }

  let(:valid_attributes) do
    {
      description: 'description',
      title: 'title',
      how_to_apply: 'how to',
      city_id: City.make!.id,
      tag_ids: [ tag.id ]
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
    it_requires_authentication { get :index }

    with_valid_user do
      it "lists the posts that the user posted" do
        Job.make! # another user job
        job = Job.make!(user: user)
        get :index
        expect(assigns(:jobs)).to eq([job])
      end

      it_responds_with_success { get :index }
      it_renders_template(:index) { get :index }
    end
  end

  describe "#edit" do
    it_requires_authentication { get :edit, id: 1 }

    with_valid_user do
      let(:job) { Job.make!(user: user) }

      it "assigns job to @job" do
        get :edit, id: job.id
        expect(assigns(:job)).to eq(job)
      end

      it_responds_with_success { get :edit, id: job.id }
      it_renders_template(:edit) { get :edit, id: job.id }
    end
  end

  describe "#show" do
    it_requires_authentication { get :show, id: 1 }

    with_valid_user do
      let(:job) { Job.make!(user: user) }

      it "assigns job to @job" do
        get :show, id: job.id
        expect(assigns(:job)).to eq(job)
      end

      it_responds_with_success { get :show, id: job.id }
      it_renders_template(:show) { get :show, id: job.id }
    end
  end

  describe "#new" do
    it_requires_authentication { get :new }

    with_valid_user do
      it "assigns a new record to @job" do
        get :new
        expect(assigns(:job)).to be_a_new(Job)
        expect(assigns(:job).user).to eq(user)
      end

      it_responds_with_success { get :new }
      it_renders_template(:new) { get :new }
    end
  end

  describe "#create" do
    it_requires_authentication { post :create }

    with_valid_user do
      describe "with valid attribbutes" do
        it "creates a new record" do
          expect do
            post :create, job: valid_attributes
          end.to change { user.jobs.count }.by(1)
        end

        it "creates tags associations" do
          expect do
            post :create, job: valid_attributes
          end.to change { tag.jobs.count }.by(1)
        end

        it "redirects to #show" do
          post :create, job: valid_attributes
          expect(response).to redirect_to(Job.last)
        end

        it_sets_flash_message(:notice) { post :create, job: valid_attributes }
      end

      describe "with invalid attributes" do
        it_responds_with_success { post :create, job: invalid_attributes }
        it_renders_template(:new) { post :create, job: invalid_attributes }
        it_sets_flash_message(:alert, true) { post :create, job: invalid_attributes }
      end
    end
  end


  describe "#update" do
    it_requires_authentication { patch :update, id: 1 }

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
    it_requires_authentication { delete :destroy, id: 1 }

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
