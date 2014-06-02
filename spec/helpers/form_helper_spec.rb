require 'spec_helper'

describe FormHelper, "#options_for_available_cities" do
  it "returns the job types that are available" do
    expected   = City.make!
    unexpected = City.make!
    job        = Job.make!(city: expected)

    expect(helper.options_for_available_cities).to eq([
      [expected.name, expected.id]
    ])
  end
end

describe FormHelper, '#options_for_cities' do
  it "returns empty array when no id is given" do
    city
    expect(helper.options_for_cities).to eq([])
    expect(helper.options_for_cities(city.state_id)).to eq([[city.name, city.id]])
  end
end
