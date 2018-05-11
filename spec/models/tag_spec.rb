# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag do
  describe '#name' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  it { should have_and_belong_to_many(:jobs).class_name(Job.to_s) }
end
