require 'spec_helper'

describe Oauth::Facebook do
  include OmniauthModelSpecs
  it_behaves_like_a_strategy_model(Oauth::Facebook, :facebook);
end
