require 'spec_helper'

describe JobsController do
  include ControllersSpecHelpers

  describe "GET 'index'" do
    let(:job) { Job.make }

    before do
      chain = double(:query)
      expect(chain).to receive(:page).and_return([job])
      expect(Job).to receive(:open).and_return(chain)
    end

    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end

    it "assigns jobs to @jobs" do
      get :index
      expect(assigns(:jobs)).to eq([job])
    end
  end

  describe "GET 'show'" do
    let(:job) { Job.make! }
    it_responds_with_success { get :show, id: job.to_param }

    it "assigns job" do
      get :show, id: job.to_param
      expect(assigns(:job)).to eq(job)
    end
  end
end
