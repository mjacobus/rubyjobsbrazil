class JobsController < ::RecruiterController
  respond_to :html, :json

  def index
    @jobs = ::Recruiter::Filters::JobFilter.filter(filter_params).
      open.page(page).per(per_page)

    respond_with(@jobs)
  end

  def show
    @job = Recruiter::Job.find(params[:id])
    ensure_canonical_url(@job) do
      respond_with(@job)
    end
  end

  private

  def filter_params
    params.select { |k, v| v.present? }
  end
end
