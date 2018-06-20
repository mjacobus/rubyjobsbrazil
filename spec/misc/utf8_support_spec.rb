require 'rails_helper'

RSpec.describe 'UTF8 mb4 support on' do
  let(:emoji) { '😂😝' }

  describe 'jobs.' do
    specify 'title is accepted' do
      Job.make!(title: emoji)
    end
  end
end
