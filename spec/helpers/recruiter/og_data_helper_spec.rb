# frozen_string_literal: true

require 'rails_helper'

module Recruiter
  RSpec.describe OgDataHelper, type: :helper do
    it 'saves og data' do
      expect do
        helper.og_data(:name, 'foo')
      end.to change {
        helper.og_data(:name)
      }.from(nil).to('foo')
    end
  end
end
