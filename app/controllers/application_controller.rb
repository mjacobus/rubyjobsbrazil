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
    canonical_url = url_for(model)

    if canonical_url.to_s == request.original_url.to_s
      instance_eval(&block)
      return
    end

    redirect_to canonical_url
  end
end
