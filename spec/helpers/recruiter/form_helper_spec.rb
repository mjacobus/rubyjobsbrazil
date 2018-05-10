require 'rails_helper'

module Recruiter
  describe FormHelper, "#options_for_available_cities", type: :helper do
    it "returns the job types that are available" do
      expected   = City.make!
      unexpected = City.make!
      Job.make!(city: expected)
      Job.make!(city: unexpected)

      expect(helper.options_for_available_cities(expected.state_id)).to eq([
        [expected.name, expected.id]
      ])
    end
  end

  describe FormHelper, '#options_for_cities', type: :helper do
    it "returns empty array when no id is given" do
      city
      expect(helper.options_for_cities).to eq([])
      expect(helper.options_for_cities(city.state_id)).to eq([[city.name, city.id]])
    end
  end
end
