require "rails_helper"

describe HomeController, "routing", type: :routing do

  it "routes to #index" do
    expect(get('/')).to route_to('home#index')
    expect(get(root_path)).to route_to('home#index')
  end
end
