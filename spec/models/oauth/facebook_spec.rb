# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Oauth::Facebook do
  include OmniauthModelSpecs
  it_behaves_like_a_strategy_model(Oauth::Facebook, :facebook)
end
