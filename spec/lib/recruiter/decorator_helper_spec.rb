# frozen_string_literal: true

require 'spec_helper'

describe Recruiter::DecoratorHelper do
  subject do
    Class.new do
      include Recruiter::DecoratorHelper

      def decorated_true
        decorate_boolean(true)
      end

      def decorated_false
        decorate_boolean(false)
      end
    end.new
  end

  it 'decorates boolean' do
    expect(subject.decorated_true).to eq('Sim')
    expect(subject.decorated_false).to eq('Não')
  end
end
