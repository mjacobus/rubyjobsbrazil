# frozen_string_literal: true

require 'rails_helper'

module Recruiter
  describe Filters::CityFilter, '.filter' do
    let!(:sl) { City.make!(name: 'Sao Leopoldo') }
    let!(:nh) { City.make!(name: 'Novo Hamburgo') }

    it 'returns cities ids and names' do
      expect(described_class.filter).to eq([nh, sl])
    end

    it 'returns only the ones with open jobs' do
      Job.make! city: nh, open: true
      Job.make! city: sl, open: false
      expect(described_class.filter(open_jobs: true)).to eq([nh])
    end

    it 'returns only the ones with job' do
      Job.make! city: nh
      Job.make! city: nh
      expect(described_class.filter(jobs: true)).to eq([nh])
    end

    it 'returns cities within a given state' do
      expect(described_class.filter(state_id: nh.state_id)).to eq([nh])
    end
  end
end
