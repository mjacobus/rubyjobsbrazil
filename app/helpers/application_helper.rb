# frozen_string_literal: true

module ApplicationHelper
  # quick fix to some recruiter references
  def recruiter
    self
  end

  # quick fix to some recruiter references
  def method_missing(method, *args)
    if method.to_s.match(/recruiter_.*(path|url)/)
      return send(method.sub('recruiter_'), *args)
    end

    super
  end
end
