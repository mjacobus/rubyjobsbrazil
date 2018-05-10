# frozen_string_literal: true

require 'rails_helper'

describe Recruiter::Oauth::Facebook do
  include OmniauthModelSpecs
  it_behaves_like_a_strategy_model(Recruiter::Oauth::Facebook, :facebook)
end
