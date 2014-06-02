class JobsController < ApplicationController
  def index
    @jobs = ::Filters::JobFilter.filter(params).open.page(page).per(per_page)
  end

  def show
    @job = Job.find(params[:id])
  end
end
