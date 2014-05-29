class JobsController < ApplicationController
  def index
    @jobs = Job.open.page(page).per(per_page)
  end

  def show
    @job = Job.find(params[:id])
  end
end
