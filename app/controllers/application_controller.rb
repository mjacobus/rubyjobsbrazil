# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Recruiter::CrudFlashMessagerHelper

  layout 'recruiter/application'

  protected

  def page
    params[:page]
  end

  def per_page
    params[:per_page]
  end

  def ensure_canonical_url(model, &block)
    if model.is_a?(Recruiter::Job)
      canonical_url = job_url(model)
    elsif model.is_a?(Recruiter::Article)
      canonical_url = article_url(model)
    else
      raise "Unknown canonical url"
    end

    if canonical_url.to_s == request.original_url.to_s
      instance_eval(&block)
      return
    end

    redirect_to canonical_url
  end

  # workaround until Recruiter namespace is removed
  def method_missing(method, *args)
    if method.to_s.match(/recruiter_.*(path|url)/)
      return send(method.to_s.sub('recruiter_', ''), *args)
    end

    super(method, *args)
  end
end
