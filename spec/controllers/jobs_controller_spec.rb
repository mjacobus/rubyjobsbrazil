require 'spec_helper'

describe JobsController do
  let(:job) { Job.make! }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: job.id
      expect(response).to be_success
    end
  end

end
