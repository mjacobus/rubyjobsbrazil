# frozen_string_literal: true

module Users
  class JobsController < UserController
    before_action :set_job, only: %i[edit update destroy]
    skip_before_action :authenticate_user!, only: [:show]

    def index
      @jobs = jobs.page(page).per(per_page)
      respond_with(:user, @jobs)
    end

    def show
      @job = Job.find(params[:id])

      unless current_user
        return redirect_to(job_url(@job))
      end

      unless current_user.admin? || @job.belongs_to?(current_user)
        return redirect_to(job_url(@job))
      end

      respond_with(:user, @job)
    end

    def edit
      respond_with(:user, @job)
    end

    def new
      # TODO: This fixes issue #10. Not a beautiful thing to do here
      flash.delete(:alert)
      @job = user_jobs.new
      respond_with_job(@job)
    end

    def create
      @job = user_jobs.build(job_params)
      crud_flash @job.save
      respond_with_job(@job)
    end

    def update
      crud_flash @job.update(job_params)
      respond_with_job(@job)
    end

    def destroy
      crud_flash @job.destroy
      respond_with_job(@job)
    end

    private

    def jobs
      if current_user.admin?
        return Job.all
      end

      user_jobs
    end

    def user_jobs
      current_user.jobs
    end

    def set_job
      @job = jobs.find(params[:id])
    end

    def job_params
      params.require(:job).permit(
        :title, :description, :how_to_apply, :city_id, :state_id, tag_ids: []
      ).to_hash.reverse_merge(tag_ids: [])
    end

    def respond_with_job(_job)
      respond_with(:user, @job)
    end
  end
end
