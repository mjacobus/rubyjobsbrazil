# frozen_string_literal: true

module Records
  extend ActiveSupport::Concern

  included do
    let(:admin)  { User.make!(admin: true) }
    let(:user)   { User.make! }
    let(:user2)  { User.make! }
    let(:user3)  { User.make! }

    let(:city) { City.make! }
    let(:state) { city.state }

    let(:user_job) { Job.make!(user: user) }
    let(:admin_job) { Job.make!(user: admin) }

    let(:user_article) { Article.make!(user: user) }
    let(:admin_article) { Article.make!(user: admin) }
  end
end
