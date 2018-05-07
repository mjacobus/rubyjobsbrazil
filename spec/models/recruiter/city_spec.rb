require 'spec_helper'

module Recruiter
  describe City do

    describe '#state' do
      it { should belong_to(:state) }
    end

    describe '#name' do
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name).scoped_to(:state_id).case_insensitive }
    end

    describe '#short' do
      it { should_not validate_presence_of(:short) }
    end

    describe '.with_open_jobs' do
      it "returns only cities with open jobs" do
        expected   = City.make!
        unexpected = City.make!
        Job.make!(city: expected, open: true)
        Job.make!(city: expected, open: false)

        expect(City.with_open_jobs).to eq([expected])
      end
    end
  end
end
