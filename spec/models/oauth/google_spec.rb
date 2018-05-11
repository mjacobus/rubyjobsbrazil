# frozen_string_literal: true

require 'rails_helper'

describe Oauth::Google do
  include OmniauthModelSpecs
  it_behaves_like_a_strategy_model(Oauth::Google, :google_oauth2)
end
