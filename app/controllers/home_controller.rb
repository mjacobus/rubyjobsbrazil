class HomeController < ApplicationController
  def index
    @jobs = Recruiter::Job.open.limit(3)
    @articles = Recruiter::Article.published.limit(3)
  end
end
