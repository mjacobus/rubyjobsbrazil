require 'spec_helper'

describe HighVoltage::PagesController, "routes" do
  it "routes to home page" do
    expect(get('/')).to route_to('high_voltage/pages#show', id: 'home')
    expect(get(root_path)).to route_to('high_voltage/pages#show', id: 'home')
  end
end
