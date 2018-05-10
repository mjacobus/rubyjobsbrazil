# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @jobs = Job.open.limit(3)
    @articles = Article.published.limit(3)
  end
end
