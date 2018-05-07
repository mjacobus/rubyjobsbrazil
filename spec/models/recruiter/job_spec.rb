require 'spec_helper'

describe Recruiter::Job do
  it { should belong_to(:user) }
  it { should belong_to(:city) }
  it { should have_and_belong_to_many(:tags).class_name(Recruiter::Tag.to_s) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:how_to_apply) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:city) }

  describe "#to_param" do
    it "returns the parameterized title" do
      job = described_class.make({ id: 12, title: 'Some Title' })
      expect(job.to_param).to eq('12-some-title')
    end
  end

  describe ".open" do
    it "returns only the enabled records" do
      open   = described_class.make! open: true
      closed = described_class.make! open: false

      expect(described_class.open).to eq([open])
    end
  end

  describe "#state_id" do
    it "returns the state id" do
      city = Recruiter::City.new state_id: 1

      expect do
        subject.city = city
      end.to change { subject.state_id }.from(nil).to(1)

      expect do
        subject.state_id = '2'
      end.to change { subject.state_id }.to(2)
    end
  end
end
