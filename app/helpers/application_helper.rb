# frozen_string_literal: true

module ApplicationHelper
  # quick fix to some recruiter references
  def recruiter
    self
  end

  def current_user
  end

  def recruiter_job_path(job)
    job_path(job)
  end

  def recruiter_job_url(job)
    job_url(job)
  end

  def recruiter_article_path(article)
    article_path(article)
  end
end
