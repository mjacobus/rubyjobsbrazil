# frozen_string_literal: true

require 'rails_helper'

describe Recruiter::Render::HTML do
  it 'inherits from Redcarpet::Render::HTML' do
    expect(subject).to be_a Redcarpet::Render::HTML
  end

  describe '#block_code' do
    it 'returns a text highlighted text'
  end
end
