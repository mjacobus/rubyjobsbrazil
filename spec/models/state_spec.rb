# frozen_string_literal: true

require 'rails_helper'

RSpec.describe State, '#short' do
  it { should validate_presence_of(:short) }
  it { should validate_uniqueness_of(:short).case_insensitive }
end

RSpec. describe State, '#name' do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end

RSpec. describe State, '.open_jobs' do
  it 'returns only states with open_jobs' do
    expected   = City.make!
    unexpected = City.make!
    Job.make!(city: expected, open: true)
    Job.make!(city: expected, open: false)

    expect(State.with_open_jobs).to eq([expected.state])
  end
end
