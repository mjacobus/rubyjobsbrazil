require 'rails_helper'

describe Recruiter::Oauth::Google do
  include OmniauthModelSpecs
  it_behaves_like_a_strategy_model(Recruiter::Oauth::Google, :google_oauth2);
end
