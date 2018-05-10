require 'rails_helper'

module Recruiter
  RSpec.describe OgDataHelper, type: :helper do
    it "saves og data" do
      expect {
        helper.og_data(:name, 'foo')
      }.to change {
        helper.og_data(:name)
      }.from(nil).to('foo')
    end
  end
end
