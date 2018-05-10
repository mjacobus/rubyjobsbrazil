class RecruiterController  < ApplicationController
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
    else
      canonical_url = url_for(model)
    end

    if canonical_url.to_s == request.original_url.to_s
      instance_eval(&block)
      return
    end

    redirect_to canonical_url
  end
end
