# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Oauth::Github do
  include OmniauthModelSpecs
  it_behaves_like_a_strategy_model(Oauth::Github, :github)
end
