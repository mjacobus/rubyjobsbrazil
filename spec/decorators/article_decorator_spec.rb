# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticleDecorator do
  let(:item) { instance_double(Article) }
  subject { described_class.new(item) }

  it 'decorates #published?' do
    allow(item).to receive(:published?).and_return(true)

    expect(subject.published?).to eq('Sim')
  end
end
