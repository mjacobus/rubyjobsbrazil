# frozen_string_literal: true

require 'rails_helper'

describe FiltersController, 'routing', type: :routing do
  it 'routes to #index' do
    expect(get('/filters')).to route_to('filters#index')
    expect(get(filters_path)).to route_to('filters#index')
  end
end
