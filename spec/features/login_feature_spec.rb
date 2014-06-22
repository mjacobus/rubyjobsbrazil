require "spec_helper"

feature "User Session" do
  include Features::Login

  user_logs_in_and_out_with(Recruiter::Oauth::Github)
  user_logs_in_and_out_with(Recruiter::Oauth::Facebook)
  user_logs_in_and_out_with(Recruiter::Oauth::Google)
end
