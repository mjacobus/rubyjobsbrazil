# frozen_string_literal: true

require 'rails_helper'

describe FiltersController, type: :controller do
  let!(:nh)    { City.make!(name: 'Novo Hamburgo') }
  let!(:sl)    { City.make!(name: 'Sao Leopoldo') }
  let!(:job) { Job.make!(city: nh) }

  describe '#index' do
    it 'responds with success' do
      get :index, params: { filter: 'city' }
      expect(response).to be_successful
    end

    it 'responds with a json' do
      get :index, params: { filter: 'city' }

      expect(response.body).to eq([
        { id: nh.id, name: nh.name },
        { id: sl.id, name: sl.name },
      ].to_json)
    end

    it 'responds with a json' do
      get :index, params: { filter: 'city', jobs: 1 }

      expect(response.body).to eq([
        { id: nh.id, name: nh.name },
      ].to_json)
    end
  end
end
