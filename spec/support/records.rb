# frozen_string_literal: true

module Records
  extend ActiveSupport::Concern

  included do
    let(:admin)  { Recruiter::User.make!(admin: true) }
    let(:user)   { Recruiter::User.make! }
    let(:user2)  { Recruiter::User.make! }
    let(:user3)  { Recruiter::User.make! }

    let(:city) { Recruiter::City.make! }
    let(:state) { city.state }

    let(:user_job) { Recruiter::Job.make!(user: user) }
    let(:admin_job) { Recruiter::Job.make!(user: admin) }

    let(:user_article) { Recruiter::Article.make!(user: user) }
    let(:admin_article) { Recruiter::Article.make!(user: admin) }
  end
end
