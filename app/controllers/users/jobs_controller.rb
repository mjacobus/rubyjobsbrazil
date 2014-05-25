module Users
  class JobsController < UserController

    def index
      @jobs = scope
      respond_with(@jobs)
    end

    private

    def scope
      current_user.jobs
    end
  end
end
