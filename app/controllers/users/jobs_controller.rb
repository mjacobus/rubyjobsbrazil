module Users
  class JobsController < UserController
    before_action :set_job, only: [:show, :edit, :update, :destroy]

    def index
      @jobs = scope
      respond_with(@jobs)
    end

    def show
      respond_with(@job)
    end

    def edit
      respond_with(@job)
    end

    def new
      # TODO: This fixes issue #10. Not a beautiful think to do here
      flash.delete(:alert)
      @job = scope.new
      respond_with(@job)
    end

    def create
      @job = scope.build(job_params)
      crud_flash @job.save
      respond_with(@job)
    end

    def update
      crud_flash @job.update(job_params)
      respond_with(@job)
    end

    def destroy
      crud_flash @job.destroy
      respond_with(@job)
    end

    private

    def scope
      current_user.jobs
    end

    def set_job
      @job = scope.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :description, :how_to_apply)
    end
  end
end
