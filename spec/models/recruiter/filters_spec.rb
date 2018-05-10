# frozen_string_literal: true

require 'rails_helper'

module Recruiter
  describe Filters, '.filter' do
    it 'delegates the filter to the correct filter classes with the correct filter params' do
      params = { some: :params }
      filter = double
      expect(filter).to receive(:filter)
      expect(Filters::CityFilter).to receive(:new).with(params).and_return(filter)
      Filters.filter(:city, params)
    end
  end
end
