module Users
  class JobsController < UserController
    before_action :set_job, only: [:show]

    def index
      @jobs = scope
      respond_with(@jobs)
    end

    def show
      respond_with(@job)
    end

    private

    def scope
      current_user.jobs
    end

    def set_job
      @job = scope.find(params[:id])
    end
  end
end
