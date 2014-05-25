module Users
  class JobsController < ApplicationController
    respond_to :html, :json

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
