module Recruiter
  class HomeController < ::RecruiterController
    def index
      @jobs = Job.open.limit(3)
      @articles = Article.published.limit(3)
    end
  end
end
