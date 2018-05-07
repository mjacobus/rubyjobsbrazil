require "spec_helper"

module Recruiter
  describe Filters::JobFilter do
    let(:klass) { described_class }

    describe "#with_open_status" do
      it "returns only the enabled records" do
        open   = Job.make! open: true
        closed = Job.make! open: false

        expect(klass.filter(open_status: true)).to eq([open])
      end
    end

    describe "#with_city_id" do
      it "returns jobs with the city id" do
        expected = Job.make!(city: city)
        Job.make!

        expect(klass.filter(city_id: city.id)).to eq([expected])
      end
    end

    describe "#with_state_id" do
      it "returns jobs with the city id" do
        expected = Job.make!(city: city)
        Job.make!

        expect(klass.filter(state_id: city.state_id)).to eq([expected])
      end
    end
  end
end
