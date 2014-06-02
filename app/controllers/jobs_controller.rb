class JobsController < ApplicationController
  def index
    @jobs = ::Filters::JobFilter.filter(filter_params).
      open.page(page).per(per_page)
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def filter_params
    params.select { |k, v| v.present? }
  end
end
