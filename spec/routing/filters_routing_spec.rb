require "spec_helper"

describe FiltersController do
  it "routes to #index" do
    expect(get('/filters')).to route_to('filters#index')
    expect(get(filters_path)).to route_to('filters#index')
  end
end
