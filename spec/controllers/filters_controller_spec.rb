require 'spec_helper'

describe FiltersController do
  let!(:nh)    { City.make!(name: 'Novo Hamburgo') }
  let!(:sl)    { City.make!(name: 'São Leopoldo') }
  let!(:job) { Job.make!(city: nh) }

  describe "#index" do
    it "responds with success" do
      get :index, { filter: 'city' }
      expect(response).to be_success
    end

    it "responds with a json" do
      get :index, { filter: 'city' }

      expect(response.body).to eq([
        { id: nh.id, name: nh.name },
        { id: sl.id, name: sl.name },
      ].to_json)
    end

    it "responds with a json" do
      get :index, { filter: 'city', jobs: 1 }

      expect(response.body).to eq([
        { id: nh.id, name: nh.name },
      ].to_json)
    end
  end
end
