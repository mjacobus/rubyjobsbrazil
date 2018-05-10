# frozen_string_literal: true

module ApplicationHelper
  # quick fix to some recruiter references
  def recruiter
    self
  end

  # quick fix to some recruiter references
  def method_missing(method, *args)
    if /recruiter_.*(path|url)/.match?(method.to_s)
      return send(method.to_s.sub('recruiter_', ''), *args)
    end

    super
  end
end
