require 'spec_helper'

describe Job do
  it { should belong_to(:user) }
  it { should belong_to(:city) }
  it { should have_and_belong_to_many(:tags) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:how_to_apply) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:city) }

  describe "#to_param" do
    it "returns the parameterized title" do
      job = Job.make({ id: 12, title: 'Some Title' })
      expect(job.to_param).to eq('12-some-title')
    end
  end

  describe ".open" do
    it "returns only the enabled records" do
      open   = Job.make! open: true
      closed = Job.make! open: false

      expect(Job.open).to eq([open])
    end
  end

  describe "#state_id" do
    it "returns the state id" do
      city = mock_model(City, state_id: 1)

      expect do
        subject.city = city
      end.to change { subject.state_id }.from(nil).to(1)

      expect do
        subject.state_id = '2'
      end.to change { subject.state_id }.to(2)
    end
  end
end
