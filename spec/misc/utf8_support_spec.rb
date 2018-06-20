# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UTF8 mb4 support on' do
  let(:emoji) { '😂😝' }

  describe 'jobs.' do
    specify 'title is accepted' do
      expect do
        Job.make!(title: emoji)
      end.not_to raise_error
    end

    specify 'description is accepted' do
      expect do
        Job.make!(description: emoji)
      end.not_to raise_error
    end

    specify 'how_to_apply is accepted' do
      expect do
        Job.make!(how_to_apply: emoji)
      end.not_to raise_error
    end
  end

  describe 'articles.' do
    specify 'title is accepted' do
      expect do
        Article.make!(title: emoji)
      end.not_to raise_error
    end

    specify 'body is accepted' do
      expect do
        Article.make!(body: emoji)
      end.not_to raise_error
    end
  end
end
