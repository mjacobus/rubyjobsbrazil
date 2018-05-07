require 'spec_helper'

describe Recruiter::Oauth::Github do
  include OmniauthModelSpecs
  it_behaves_like_a_strategy_model(Recruiter::Oauth::Github, :github);
end
