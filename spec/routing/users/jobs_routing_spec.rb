require "spec_helper"

describe Users::JobsController, "routing" do
  it "routes to index" do
    expect(get('profile/jobs')).to route_to('users/jobs#index')
  end
end
