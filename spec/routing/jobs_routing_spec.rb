# frozen_string_literal: true

require 'rails_helper'

describe JobsController, 'routing', type: :routing do
  it 'routes to #index' do
    expect(get('/jobs')).to route_to('jobs#index')
    expect(get(jobs_path)).to route_to('jobs#index')
  end

  it 'routes to #show' do
    expect(get('jobs/1')).to route_to('jobs#show', id: '1')
    expect(get(job_path(1))).to route_to('jobs#show', id: '1')
  end
end
